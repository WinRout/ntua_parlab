// global
__global__
void dot_product(float *out, float *a, float *b, int n){
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid>=n) return ;
    float partial_result = a[tid]*b[tid];
    atomicAdd(out, partial_result)
}