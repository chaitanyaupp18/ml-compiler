# ml-compiler

Exploring the ML Compiler pipeline, starting from PyTorch to Machine Code:

```
PyTorch -> MLIR -> LLVM-IR -> ObjectFile -> executable
```

A small 2-layer MLP is exported from PyTorch with Torch-MLIR, lowered to the LLVM
dialect, translated to LLVM IR, compiled to an object, and linked with a C++ driver
into a native executable (macOS ARM64).

## Usage

```
python3 model.py        # export the model to MLIR (representations/*.mlir)
make                    # lower kernel/model_affine.mlir -> LLVM IR -> object -> exe
./model/myNeuralNet     # run it
```

`make generate` rebuilds `kernel/model_affine.mlir` from the linalg MLIR.

## Layout

```
kernel/model_affine.mlir       C-callable @model kernel (build input)
kernel/driver.cpp              main(): feeds an input, calls model(), prints
representations/               exported MLIR (torch, linalg-on-tensors)
scripts/inline_constants.py    inline dense_resource weights (for make generate)
mlir_output/                   build intermediates
model/myNeuralNet              the executable
```

## Requirements

`mlir-opt`, `mlir-translate`, `llc` (set the `MLIR` path in the Makefile), `clang++`,
and Python with `torch` + `torch-mlir`.
