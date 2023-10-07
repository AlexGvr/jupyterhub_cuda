FROM nvidia/cuda:11.8.0-base-ubuntu22.04

WORKDIR /app/analysis

RUN apt-get upgrade -y && apt-get update -y && apt-get install -y python3-pip && pip3 install --upgrade pip
RUN apt-get install npm nodejs sudo -y && \
    npm install -g configurable-http-proxy && \
    pip3 install jupyterhub && \
    pip3 install --upgrade notebook && \
    pip3 install pandas scipy matplotlib numpy plotly tqdm scikit-learn dvc dvc[ssh] tensorflow[and-cuda] && \
    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 && \
    pip3 install "dask[distributed,dataframe]" && \   
    pip3 install dask_labextension && \
    useradd admin && echo admin:change.it! | chpasswd && mkdir /home/admin && chown admin:admin /home/admin

ADD jupyterhub_config.py /app/analysis/jupyterhub_config.py
ADD create-user.py /app/analysis/create-user.py

RUN mkdir -p /opt/oracle
WORKDIR    /opt/oracle
RUN        apt-get update && apt-get install -y libaio1 wget unzip \
            && wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip \
            && unzip instantclient-basiclite-linuxx64.zip \
            && rm -f instantclient-basiclite-linuxx64.zip \
            && cd /opt/oracle/instantclient* \
            && rm -f *jdbc* *occi* *mysql* *README *jar uidrvci genezi adrci \
            && echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf \
            && ldconfig

RUN apt install -y git
RUN pip3 install cx_Oracle plotly ipywidgets

WORKDIR /app/analysis

CMD ["jupyterhub", "--ip=0.0.0.0", "--port=8000", "--no-ssl"]

EXPOSE 8000
