FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

RUN apt-get update && apt-get install git -y

WORKDIR /home/my_proj

RUN mkdir imports \
    && git clone -b release-v3-c-cpp --single-branch https://github.com/NVIDIA/NVTX.git imports/NVTX

COPY main.cu main.cu
RUN nvcc -arch=sm_75 --std=c++17 -O3 -I imports/NVTX/include main.cu

CMD nvprof ./a.out