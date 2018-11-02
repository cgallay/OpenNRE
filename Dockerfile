FROM tensorflow/tensorflow:latest-gpu

COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app
RUN pip install -r requirements.txt

ADD . notebooks/gits
