PWD            := $(shell pwd)
MLIR           := /path/to/llvm-project/build/bin
MLIR_OPT       := $(MLIR)/mlir-opt
MLIR_TRANSLATE := $(MLIR)/mlir-translate
LLC            := $(MLIR)/llc
CLANG          := $(MLIR)/clang++

SRC_MLIR   := $(PWD)/kernel/model_affine.mlir
DRIVER     := $(PWD)/kernel/driver.cpp
LINALG_SRC := $(PWD)/representations/mlir_linalg-on-tensors.mlir

OUT_DIR   := $(PWD)/mlir_output
MODEL_DIR := $(PWD)/model
TARGET    := $(MODEL_DIR)/myNeuralNet

LLVM_DIALECT := $(OUT_DIR)/model_llvm_dialect.mlir
LLVM_IR      := $(OUT_DIR)/model.ll
LLVM_ASM     := $(OUT_DIR)/model.s
LLVM_OBJ     := $(OUT_DIR)/model.o

LOWER_PIPELINE := \
	--lower-affine \
	--convert-scf-to-cf \
	--finalize-memref-to-llvm \
	--convert-func-to-llvm="use-bare-ptr-memref-call-conv" \
	--convert-arith-to-llvm \
	--convert-cf-to-llvm \
	--reconcile-unrealized-casts

GEN_BUFFERIZE := --one-shot-bufferize="bufferize-function-boundaries function-boundary-type-conversion=identity-layout-map"
GEN_OUTPARAMS := --buffer-results-to-out-params="modify-public-functions hoist-static-allocs"

.PHONY: all run clean asm inspect-llvm inspect-asm

all: $(TARGET)

$(LLVM_DIALECT): $(SRC_MLIR) | $(OUT_DIR)
	@echo "=== [1/4] affine MLIR -> LLVM dialect ==="
	$(MLIR_OPT) $(LOWER_PIPELINE) $< -o $@

$(LLVM_IR): $(LLVM_DIALECT)
	@echo "=== [2/4] LLVM dialect -> LLVM IR ==="
	$(MLIR_TRANSLATE) --mlir-to-llvmir $< -o $@

$(LLVM_OBJ): $(LLVM_IR)
	@echo "=== [3/4] LLVM IR -> object ==="
	$(LLC) -O3 --filetype=obj $< -o $@

$(LLVM_ASM): $(LLVM_IR)
	$(LLC) -O3 $< -o $@

$(TARGET): $(LLVM_OBJ) $(DRIVER) | $(MODEL_DIR)
	@echo "=== [4/4] link -> $@ ==="
	$(CLANG) $(DRIVER) $(LLVM_OBJ) -o $@

$(SRC_MLIR): $(LINALG_SRC) | $(OUT_DIR)
	python3 scripts/inline_constants.py $(LINALG_SRC) $(OUT_DIR)/linalg_inline.mlir
	$(MLIR_OPT) $(OUT_DIR)/linalg_inline.mlir $(GEN_BUFFERIZE) $(GEN_OUTPARAMS) --convert-linalg-to-affine-loops -o $(OUT_DIR)/kernel_affine.mlir
	sed 's/@main(/@model(/' $(OUT_DIR)/kernel_affine.mlir > $(SRC_MLIR)

run: $(TARGET)
	@$(TARGET)

asm: $(LLVM_ASM)

inspect-llvm: $(LLVM_IR)
	@cat $(LLVM_IR)

inspect-asm: $(LLVM_ASM)
	@cat $(LLVM_ASM)

$(OUT_DIR) $(MODEL_DIR):
	@mkdir -p $@

clean:
	@rm -rf $(OUT_DIR) $(TARGET) $(SRC_MLIR)
