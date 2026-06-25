# ml-compiler

Exploring the ML compiler pipeline — taking a neural network from Python all the way
down to a native executable, and looking at every layer in between.

The same small MLP (`Linear(5->10) -> Linear(10->2) -> ReLU`) is taken to machine code
two different ways:

- **[PyTorch/](PyTorch/)** — hand-lowered through MLIR. Torch-MLIR emits
  linalg-on-tensors, then `mlir-opt` / `mlir-translate` / `llc` carry it down through
  affine -> LLVM dialect -> LLVM IR -> object, linked with a C++ driver. You drive
  every lowering step yourself.

- **[JAX/](JAX/)** — let XLA do the codegen. `model.py` dumps XLA's compiled object
  files; the Makefile links XLA's fused kernel directly against a C++ driver that calls
  it through XLA's runtime ABI.

```
PyTorch  ->  MLIR (torch -> linalg -> affine -> llvm)  ->  LLVM IR  ->  object  ->  exe
JAX      ->  StableHLO / HLO  ->  XLA  ->  object (fused kernel)               ->  exe
```

Each directory has its own README with build and run steps.
