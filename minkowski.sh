export PATH="/home/lxiaol9/anaconda3/bin:$PATH"
https://github.com/NVIDIA/MinkowskiEngine/issues/124
cd 
. scripts/ai_power1.sh
module load cuda/10.0.130
source activate merl

# python 3.7
conda create -n mev5 python=3.7
conda install mkl mkl-include -c intel
# conda install pytorch==1.6.0 -c pytorch
pip install torch==1.6.0 torchvision==0.7.0
# git clone https://github.com/StanfordVL/MinkowskiEngine.git
cd MinkowskiEngine
python setup.py install --blas=mkl

python setup.py clean --all

module purge
module load gcc/7.5.0 openblas/0.3.6 cuda/10.2.89
module load gcc/7.4.0 openblas/0.3.6 cuda/10.2.89
module load gcc/8.4.0 openblas/0.3.6 cuda/10.2.89/
# pytorch 1.5
python setup.py install --blas=openblas --force_cuda

# error located 
/opt/apps/cuda/10.2.89/bin/nvcc -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include 
-I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/torch/csrc/api/include 
-I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/TH -
I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/THC 
-I/opt/apps/cuda/10.2.89/include -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src 
-I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/3rdparty -I/home/lxiaol9/anaconda3/envs/e3d/include/python3.6m 
-c -c /home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.cu 
-o /home/lxiaol9/3DGenNet2019/MinkowskiEngine/build/temp.linux-x86_64-3.6/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.o 
-D__CUDA_NO_HALF_OPERATORS__ -D__CUDA_NO_HALF_CONVERSIONS__ -D__CUDA_NO_HALF2_OPERATORS__ --expt-relaxed-constexpr --compiler-options 
''"'"'-fPIC'"'"'' --expt-relaxed-constexpr --expt-extended-lambda -I/opt/apps/gcc7_3/openblas/0.3.6/include -ccbin=g++ 
-O3 -DTORCH_API_INCLUDE_EXTENSION_H -DTORCH_EXTENSION_NAME=_C -D_GLIBCXX_USE_CXX11_ABI=0 -gencode=arch=compute_70,code=sm_70
/opt/apps/cuda/10.2.89/bin/nvcc -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/torch/csrc/api/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/TH -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/THC -I/opt/apps/cuda/10.2.89/include -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/3rdparty -I/home/lxiaol9/anaconda3/envs/e3d/include/python3.6m -c -c /home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.cu -o /home/lxiaol9/3DGenNet2019/MinkowskiEngine/build/temp.linux-x86_64-3.6/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.o -D__CUDA_NO_HALF_OPERATORS__ -D__CUDA_NO_HALF_CONVERSIONS__ -D__CUDA_NO_HALF2_OPERATORS__ --expt-relaxed-constexpr --compiler-options ''"'"'-fPIC'"'"'' --expt-relaxed-constexpr --expt-extended-lambda -I/opt/apps/gcc6_4/openblas/0.2.20/include -ccbin=g++ -O3 -DTORCH_API_INCLUDE_EXTENSION_H -DTORCH_EXTENSION_NAME=_C -D_GLIBCXX_USE_CXX11_ABI=0 -gencode=arch=compute_70,code=sm_70
# gcc 6.1
/opt/apps/cuda/10.2.89/bin/nvcc -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/torch/csrc/api/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/TH -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/THC -I/opt/apps/cuda/10.2.89/include -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/3rdparty -I/home/lxiaol9/anaconda3/envs/e3d/include/python3.6m -c -c /home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.cu -o /home/lxiaol9/3DGenNet2019/MinkowskiEngine/build/temp.linux-x86_64-3.6/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.o -D__CUDA_NO_HALF_OPERATORS__ -D__CUDA_NO_HALF_CONVERSIONS__ -D__CUDA_NO_HALF2_OPERATORS__ --expt-relaxed-constexpr --compiler-options ''"'"'-fPIC'"'"'' --expt-relaxed-constexpr --expt-extended-lambda -I/opt/apps/gcc6_1/openblas/0.2.20/include -ccbin=g++ -O3 -DTORCH_API_INCLUDE_EXTENSION_H -DTORCH_EXTENSION_NAME=_C -D_GLIBCXX_USE_CXX11_ABI=0 -gencode=arch=compute_70,code=sm_70 --std=c++14
# gcc 7.5
module load gcc/7.4.0
/opt/apps/cuda/10.2.89/bin/nvcc -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/torch/csrc/api/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/TH -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/THC -I/opt/apps/cuda/10.2.89/include -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/3rdparty -I/home/lxiaol9/anaconda3/envs/e3d/include/python3.6m -c -c /home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.cu -o /home/lxiaol9/3DGenNet2019/MinkowskiEngine/build/temp.linux-x86_64-3.6/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.o -D__CUDA_NO_HALF_OPERATORS__ -D__CUDA_NO_HALF_CONVERSIONS__ -D__CUDA_NO_HALF2_OPERATORS__ --expt-relaxed-constexpr --compiler-options ''"'"'-fPIC'"'"'' --expt-relaxed-constexpr --expt-extended-lambda -I/opt/apps/gcc7_4/openblas/0.3.6/include -ccbin=g++ -O3 -DTORCH_API_INCLUDE_EXTENSION_H -DTORCH_EXTENSION_NAME=_C -D_GLIBCXX_USE_CXX11_ABI=0 -gencode=arch=compute_70,code=sm_70 --std=c++14
# gcc 7.5
module load gcc/8.4.0
/opt/apps/cuda/10.2.89/bin/nvcc -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/torch/csrc/api/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/TH -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/THC -I/opt/apps/cuda/10.2.89/include -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/3rdparty -I/home/lxiaol9/anaconda3/envs/e3d/include/python3.6m -c -c /home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.cu -o /home/lxiaol9/3DGenNet2019/MinkowskiEngine/build/temp.linux-x86_64-3.6/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.o -D__CUDA_NO_HALF_OPERATORS__ -D__CUDA_NO_HALF_CONVERSIONS__ -D__CUDA_NO_HALF2_OPERATORS__ --expt-relaxed-constexpr --compiler-options ''"'"'-fPIC'"'"'' --expt-relaxed-constexpr --expt-extended-lambda -I/opt/apps/gcc8_4/openblas/0.3.6/include -ccbin=g++ -O3 -DTORCH_API_INCLUDE_EXTENSION_H -DTORCH_EXTENSION_NAME=_C -D_GLIBCXX_USE_CXX11_ABI=0 -gencode=arch=compute_70,code=sm_70 --std=c++14

# # gcc 5.2
# /opt/apps/cuda/10.2.89/bin/nvcc -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/torch/csrc/api/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/TH -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/THC -I/opt/apps/cuda/10.2.89/include -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/3rdparty -I/home/lxiaol9/anaconda3/envs/e3d/include/python3.6m -c -c /home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.cu -o /home/lxiaol9/3DGenNet2019/MinkowskiEngine/build/temp.linux-x86_64-3.6/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.o -D__CUDA_NO_HALF_OPERATORS__ -D__CUDA_NO_HALF_CONVERSIONS__ -D__CUDA_NO_HALF2_OPERATORS__ --expt-relaxed-constexpr --compiler-options ''"'"'-fPIC'"'"'' --expt-relaxed-constexpr --expt-extended-lambda -I/opt/apps/gcc5_2/openblas/0.2.20/include -ccbin=g++ -O3 -DTORCH_API_INCLUDE_EXTENSION_H -DTORCH_EXTENSION_NAME=_C -D_GLIBCXX_USE_CXX11_ABI=0 -gencode=arch=compute_70,code=sm_70 --std=c++14
# cuda 11
/opt/apps/cuda/11.0.1/bin/nvcc -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/torch/csrc/api/include -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/TH -I/home/lxiaol9/anaconda3/envs/e3d/lib/python3.6/site-packages/torch/include/THC -I/opt/apps/cuda/10.2.89/include -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src -I/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/3rdparty -I/home/lxiaol9/anaconda3/envs/e3d/include/python3.6m -c -c /home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.cu -o /home/lxiaol9/3DGenNet2019/MinkowskiEngine/build/temp.linux-x86_64-3.6/home/lxiaol9/3DGenNet2019/MinkowskiEngine/src/spmm.o -D__CUDA_NO_HALF_OPERATORS__ -D__CUDA_NO_HALF_CONVERSIONS__ -D__CUDA_NO_HALF2_OPERATORS__ --expt-relaxed-constexpr --compiler-options ''"'"'-fPIC'"'"'' --expt-relaxed-constexpr --expt-extended-lambda -I/opt/apps/gcc6_4/openblas/0.2.20/include -ccbin=g++ -O3 -DTORCH_API_INCLUDE_EXTENSION_H -DTORCH_EXTENSION_NAME=_C -D_GLIBCXX_USE_CXX11_ABI=0 -gencode=arch=compute_70,code=sm_70
