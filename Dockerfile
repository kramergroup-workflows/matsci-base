FROM ubuntu

WORKDIR /install
RUN apt-get update && apt-get install --no-install-recommends -y wget curl ssh-client && rm -rf /var/lib/apt/lists/* && \
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh --no-check-certificate -O Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b && \
    rm -rf /install

ENV PATH=$PATH:/root/miniconda3/bin
RUN conda create --name matsci python && \
    conda config --add channels matsci && \
    conda install --channel matsci pymatgen

WORKDIR /data