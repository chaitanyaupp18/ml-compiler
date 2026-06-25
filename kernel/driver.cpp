#include <iostream>

/*
 * The MLIR kernel is lowered with the bare-pointer memref ABI
 * (--convert-func-to-llvm="use-bare-ptr-memref-call-conv"):
 *
 *     func.func @model(%in: memref<3x5xf32>, %out: memref<3x2xf32>)
 *
 * Under that ABI each contiguous memref collapses to a single aligned data
 * pointer (no descriptor struct), so from C the kernel is simply:
 */
extern "C" void model(float *in, float *out);

int main() {

    const int batch_size = 3;
    const int input_size = 5;
    const int output_size = 2;

    float in[batch_size*input_size] = {
        1.0f, 2.0f, 3.0f, 4.0f, 5.0f,
        6.0f, 7.0f, 8.0f, 9.0f, 10.0f,
        11.0f, 12.0f, 13.0f, 14.0f, 15.0f
    };

    float out[batch_size*output_size] = {0};

    model(in, out);

    std::cout << "\n=== Inference Results:===\n\n";
    for (int i=0; i<batch_size; i++)
    {
        std::cout << out[i*output_size] << ", " << out[i*output_size + 1] << "\n";
    }

    return 0;
}
