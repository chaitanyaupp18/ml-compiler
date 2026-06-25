#include <cstdio>
#include <cstdint>

extern "C" void* broadcast_maximum_fusion(void* call_frame);

int main() {
    float data[3][5] = {
        {1.0f,  2.0f, 3.0f, 4.0f, 5.0f},
        {6.0f, 7.0f, 8.0f, 9.0f, 10.0f},
        {11.0f, 12.0f, 13.0f, 14.0f, 15.0f}
    };

    void* buffer_table[1];
    buffer_table[0] = &data[0][0];

    // XLA kernel expects:
    //   *(void**)((char*)call_frame + 24) == buffer_table
    //
    // On 64-bit:
    //   call_frame[0] at offset 0
    //   call_frame[1] at offset 8
    //   call_frame[2] at offset 16
    //   call_frame[3] at offset 24
    void* call_frame[4] = {};
    call_frame[3] = buffer_table;

    broadcast_maximum_fusion(call_frame);

    for (int i = 0; i < 3; i++) {
        printf("%f %f\n", data[i][0], data[i][1]);
    }

    return 0;
}