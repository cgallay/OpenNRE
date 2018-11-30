FROM tensorflow/tensorflow:latest-gpu-py3

COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app

RUN pip install -r requirements.txt
RUN python -m spacy download en
RUN python3 -m pip install jupyterlab
RUN apt-get update
RUN apt-get install -y git \
		curl \
		wget \
		fish 

RUN pip install virtualenv

RUN groupadd -g 1027 appuser && \
    useradd -r -u 1027 -g appuser appuser

RUN mkdir /home/appuser
RUN chown -R appuser /home/appuser
RUN chown -R appuser .

USER appuser

COPY set_env.sh /opt/app/set_env.sh
RUN ./set_env.sh

CMD jupyter lab --ip 0.0.0.0
