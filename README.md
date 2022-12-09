# NVTX3 Issue

This repository is intented to replicate NVTX3 issue with global domain ranges

## Build and run

```bash
docker build . -t nvtx_issue
docker run --rm --gpus=all nvtx_issue
```