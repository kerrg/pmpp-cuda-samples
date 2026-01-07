#include <iostream>

__global__ void rgbToGrayscaleKernel(uint8_t* p_in,
  uint8_t* p_out, int width, int height) {
  int col = blockIdx.x * blockDim.x + threadIdx.x;
  int row = blockIdx.y * blockDim.y + threadIdx.y;
  if (col < width && row < height) {

  }
}

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
