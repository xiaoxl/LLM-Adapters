FROM ubuntu:22.04

COPY requirements.txt ./requirements.txt


RUN apt update
RUN apt install python3-pip -y
# RUN which pip

RUN apt-get update
RUN apt-get install -y git
RUN git config --global user.name "xiaoxl"
RUN git config --global user.email "xiaoxinlixxl@gmail.com"

RUN pip install -r requirements.txt
RUN pip install jupyter

RUN git clone https://github.com/xiaoxl/LLM-Adapters.git


RUN pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116
RUN pip install sentencepiece
RUN pip uninstall bitsandbytes

RUN export BASE_MODEL=yahma/llama-7b-hf

RUN export BASE_MODEL=yahma/llama-7b-hf
RUN export PATH=/home/elvesguest/installations/gcc_install/bin:$PATH
RUN export PATH=/usr/local/cuda-11.6/bin:$PATH
RUN export PATH=$HOME/local/bin:$PATH
RUN export LD_LIBRARY_PATH=/home/elvesguest/installations/gcc_install/lib64:/usr/local/cuda-11.6/targets/x86_64-linux/lib:$PATH
RUN export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

# RUN apt install git-all
# RUN mkdir -p $HOME/gcc_install
# RUN cd $HOME
# RUN wget https://ftp.gnu.org/gnu/gcc/gcc-6.5.0/gcc-6.5.0.tar.gz
# RUN tar xzf gcc-6.5.0.tar.gz
# RUN cd gcc-6.5.0

# RUN ./contrib/download_prerequisites
# RUN mkdir build
# RUN cd build
# #../configure --prefix=$HOME/gcc_install --enable-languages=c,c++ --disable-multilib
# RUN ../configure --prefix=/home/elvesguest/installations/gcc_install --enable-languages=c,c++ --disable-multilib

# RUN make -j$(nproc)
# RUN make install

# RUN export PATH=/home/elvesguest/installations/gcc_install/bin:$PATH
# RUN export LD_LIBRARY_PATH=/home/elvesguest/installations/gcc_install/lib64:$LD_LIBRARY_PATH
# RUN export PATH=$PATH:/usr/local/cuda-11.6/bin

# RUN source ~/.bashrc

# RUN cd bitsandbytes
