FROM continuumio/miniconda3


RUN apt update -y && apt upgrade -y
RUN mkdir /usr/lib/jvm
RUN wget -P /usr/lib/jvm https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u402-b06/OpenJDK8U-jdk_x64_linux_hotspot_8u402b06.tar.gz
RUN tar zxvf /usr/lib/jvm/OpenJDK8U-jdk_x64_linux_hotspot_8u402b06.tar.gz -C /usr/lib/jvm
RUN rm /usr/lib/jvm/OpenJDK8U-jdk_x64_linux_hotspot_8u402b06.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/jdk8u402-b06
ENV PATH=/usr/lib/jvm/jdk8u402-b06/bin:${PATH}
ENV CLASSPATH=.:/usr/lib/jvm/jdk8u402-b06/lib

RUN conda create -y -n cheminfo python==3.10

SHELL ["conda", "run", "-n", "cheminfo", "/bin/bash", "-c"]
RUN conda install -y -c conda-forge jupyterlab matplotlib numpy pandas scikit-learn xgboost optuna
RUN conda install -y -c conda-forge jupyterlab_vim

CMD ["conda", "run", "-n", "cheminfo", "/bin/bash", "-c", "jupyter-lab --ip=0.0.0.0 --allow-root --NotebookApp.token=''"]
