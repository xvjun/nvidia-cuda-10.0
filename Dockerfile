FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04

RUN rm -f /etc/apt/sources.list.d/cuda.list /etc/apt/sources.list.d/nvidia-ml.list
#COPY ./sources.list /etc/apt/sources.list

# Install Python
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  build-essential \
  curl wget vim nano tzdata \
  software-properties-common \
  python3-pip 
RUN add-apt-repository -y ppa:jonathonf/python-3.6 
RUN apt-get update 
RUN apt-get install -y python3.6 python3.6-dev 
RUN apt-get install -y libsm6 libxrender1 libxext-dev
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*

RUN python3.6 -m pip install --no-cache-dir -U pip
RUN python3.6 -m pip install --no-cache-dir -U setuptools
RUN ln -s /usr/bin/python3.6 /usr/bin/python
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
