PWD:=$(shell pwd)
CLANG:=/usr/bin/clang++

DRIVER:=$(PWD)/kernel/driver.cpp
XLA_EXECUTABLE:=$(PWD)/representations/module_0046.jit__unnamed_function.obj-file.broadcast_maximum_fusion_kernel_module.o
TARGET:=$(PWD)/model/myNeuralNet

.PHONY: all run

$(TARGET):
	$(CLANG) $(DRIVER) $(XLA_EXECUTABLE) -o $(TARGET)

run: $(TARGET)
	@$(TARGET)

clean:
	rm -rf $(TARGET)
	