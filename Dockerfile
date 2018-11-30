FROM tensorflow/tensorflow:latest-gpu-py3

COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app

RUN pip install -r requirements.txt
RUN python -m spacy download en
RUN python3 -m pip install jupyterlab
RUN apt-get update
RUN apt-get install -y git \
		curl \
		wget

RUN groupadd -g 1027 appuser && \
    useradd -r -u 1027 -g appuser appuser

RUN mkdir /home/appuser
RUN chown -R appuser /home/appuser

USER appuser

CMD jupyter lab --ip 0.0.0.0
