#include <thread>
#include <chrono>
#include <iostream>
#include "nvtx3/nvtx3.hpp"

using namespace std::chrono_literals;

void __global__ kernel(float* a, size_t n){
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    if(tid < n){
        a[tid] = a[tid] + 10.0;
    }
}

struct my_domain{ static constexpr char const* name{"my_domain"}; };

void function_my_domain(){
    nvtx3::scoped_range_in<my_domain> r(__FUNCTION__);
    std::cout << "function_my_domain\n";
    size_t N = 10'000'000; 
    float * a;
    cudaMalloc(&a, N * sizeof(float));    
    kernel<<<N, 1>>>(a, N);
    cudaFree(a);
    std::this_thread::sleep_for(1s);
}

void function_global(){
    nvtx3::scoped_range r(__FUNCTION__);
    std::cout << "function_global\n";
    size_t N = 10'000'000; 
    float * a;
    cudaMalloc(&a, N * sizeof(float));    
    kernel<<<N, 1>>>(a, N);
    cudaFree(a);
    std::this_thread::sleep_for(1s);
}


int main(){
    function_my_domain();
    function_global();
    return 0;
}