
//host code
int main(){
    float a[N], b[N], c[N];
    float *dev_a, *dev_b, *dev_c;

    // Allocate memory on the GPU
    cudaMalloc((void**)&dev_a, N*sizeof(float));
    cudaMalloc((void**)&dev_b, N*sizeof(float));
    cudaMalloc((void**)&dev_c, N*sizeof(float));

    // Initialize data on CPU

    // Copy the array's 'a' and 'b' to the GPU
    cudaMemcpy(dev_a, a, N*sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(dev_b, b, N*sizeof(float), cudaMemcpyHostToDevice);

    // Launch the kernel with N/128 thread blocks of 128 threads
    dim1 block(128);
    dim1 grid((N+127)/128);
    vec_add<<grid, block>>(dev_a, dev_b, dev_c, N);
    // Synchronize the device! Kernel Launch is async
    cudaDeviceSynchronize();

    // Copy the array 'c' back from the GPU to the CPU
    cudaMemcpy(c, dev_c, N*sizeof(float), cudaMemcpyDeviceToHost);

    // Free the memory allocated on the GPU
    cudaFree(dev_a);
    cudaFree(dev_b);
    cudaFree(dev_c);

    return 0;
}

// device code
// version 1
__global__ void vec_add(const float *a, const float *b, float *c, int N){
    int tid = blockDim.x*blockIdx.x+threadIdx.x;
    if (tid >= N)
        return ;
    c[tid] = a[tid] +b[tid];
}

// version 2
__global__ void vec_add_2(const float *a, const float *b, float *c, int N){
    // Grid stride loop
    for (int tid = blockDim.x*blockIdx.x + threadIdx.x; tid < N; tid+=blockDim.x*gridDim.x){
        c[tid] = a[tid] + b[tid];
    }
}
