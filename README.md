# NVTX3 Issue

This repository is intented to replicate NVTX3 issue with global domain ranges

## Build and run

```bash
docker build . -t nvtx_issue
docker run --rm --gpus=all nvtx_issue
```

Result
```bash
$ docker run --rm --gpus=all nvtx_issue
==10== NVPROF is profiling process 10, command: ./a.out
function_my_domain
function_global
==10== Profiling application: ./a.out
==10== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:  100.00%  69.832ms         2  34.916ms  34.910ms  34.922ms  kernel(float*, unsigned long)
      API calls:   68.52%  153.71ms         2  76.856ms  749.80us  152.96ms  cudaMalloc
                   31.29%  70.187ms         2  35.093ms  35.088ms  35.099ms  cudaFree
                    0.10%  230.43us       101  2.2810us     369ns  94.608us  cuDeviceGetAttribute
                    0.05%  104.27us         2  52.136us  34.324us  69.948us  cudaLaunchKernel
                    0.03%  64.855us         1  64.855us  64.855us  64.855us  cuDeviceGetName
                    0.00%  10.590us         1  10.590us  10.590us  10.590us  cuDeviceGetPCIBusId
                    0.00%  3.1630us         3  1.0540us     466ns  2.1860us  cuDeviceGetCount
                    0.00%  1.3270us         2     663ns     384ns     943ns  cuDeviceGet
                    0.00%  1.1160us         1  1.1160us  1.1160us  1.1160us  cuModuleGetLoadingMode
                    0.00%     590ns         1     590ns     590ns     590ns  cuDeviceTotalMem
                    0.00%     505ns         1     505ns     505ns     505ns  cuDeviceGetUuid

==10== NVTX result:
==10==   Thread "<unnamed>" (id = 2564218880)
==10==     Domain "my_domain"
==10==       Range "function_my_domain"
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
          Range:  100.00%  1.22693s         1  1.22693s  1.22693s  1.22693s  function_my_domain
 GPU activities:  100.00%  34.910ms         1  34.910ms  34.910ms  34.910ms  kernel(float*, unsig
```