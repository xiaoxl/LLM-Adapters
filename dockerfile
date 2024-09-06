FROM xiaoxl1985/llm_adapters:v1.1

# COPY requirements.txt ./requirements.txt

# RUN pip install -r requirements.txt
RUN pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116
RUN pip install sentencepiece
RUN pip uninstall bitsandbytes
# RUN pip install jupyter

# RUN export BASE_MODEL=yahma/llama-7b-hf

RUN apt install git-all
RUN mkdir -p $HOME/gcc_install
RUN cd $HOME
RUN wget https://ftp.gnu.org/gnu/gcc/gcc-6.5.0/gcc-6.5.0.tar.gz
RUN tar xzf gcc-6.5.0.tar.gz
RUN cd gcc-6.5.0

RUN ./contrib/download_prerequisites
RUN mkdir build
RUN cd build
#../configure --prefix=$HOME/gcc_install --enable-languages=c,c++ --disable-multilib
RUN ../configure --prefix=/home/elvesguest/installations/gcc_install --enable-languages=c,c++ --disable-multilib

RUN make -j$(nproc)
RUN make install

RUN export PATH=/home/elvesguest/installations/gcc_install/bin:$PATH
RUN export LD_LIBRARY_PATH=/home/elvesguest/installations/gcc_install/lib64:$LD_LIBRARY_PATH
RUN export PATH=$PATH:/usr/local/cuda-11.6/bin

RUN source ~/.bashrc

# RUN cd bitsandbytes
