FROM python:3.9.12-slim

COPY . /

WORKDIR /

ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk/jre
RUN apt-get update && apt-get install -y g++ default-jdk

RUN mkdir -p /tmp

RUN pip install --upgrade pip 
# RUN conda install -c conda-forge mecab-ko

RUN ./cythonized.sh && apt-get clean

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

RUN pip install pip-tools

ENTRYPOINT ["python3", "Main.py"]