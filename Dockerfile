FROM tensorflow/tensorflow:latest-gpu-py3

COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app
RUN pip install -r requirements.txt
RUN python -m spacy download en
RUN python3 -m pip install jupyterlab

RUN groupadd -g 1027 appuser && \
    useradd -r -u 1027 -g appuser appuser
USER appuser

CMD jupyter lab

# ADD . notebooks/gits
