# JAX -> native executable

The same MLP as the PyTorch version (`Linear(5->10) -> Linear(10->2) -> ReLU`, written
in Flax `nnx`), but instead of hand-lowering MLIR, this lets **XLA** compile the model
and then links XLA's emitted object file directly.

`model.py` traces the model and dumps every stage into `representations/`: the eager
output, the jaxpr, StableHLO, XLA HLO, and — with XLA's dump enabled — the per-fusion
object files XLA's CPU backend produces. The Makefile links one of those kernels with
`kernel/driver.cpp`, which calls it through XLA's call-frame ABI (a buffer table passed
to the kernel at a fixed offset).

## Usage

```
XLA_FLAGS=--xla_dump_to=representations python3 model.py   # dump IR + object files
make                                                       # link driver + XLA kernel .o
./model/myNeuralNet
```

## Layout

```
model.py             trace the model; dump jaxpr / StableHLO / HLO / objects
src/MyNeuralNet.py   the Flax nnx MLP
kernel/driver.cpp    calls the XLA kernel via its call-frame ABI
representations/      XLA's dumps at every stage + the per-fusion .o files
model/myNeuralNet    the executable
Makefile             links driver + the fused-kernel object
```

## Status

This is the "let XLA codegen, grab its object" route, in contrast to PyTorch/'s
hand-rolled MLIR lowering. The Makefile currently links a single fused kernel
(`module_0046...broadcast_maximum_fusion...o`, the ReLU), so the executable exercises
the XLA call-frame ABI but not the whole forward pass yet — the matmuls live in their
own object files (`module_0030/0036...dot_general...o`) and would need to be linked and
sequenced through XLA's runtime to get the full result.
