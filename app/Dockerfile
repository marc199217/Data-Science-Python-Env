FROM jupyter/minimal-notebook:latest

USER root

COPY install-packages.sh .
RUN ./install-packages.sh

COPY requirements.txt /tmp/
RUN pip install --upgrade pip && pip install --no-cache-dir -r /tmp/requirements.txt

COPY ./kaggle /root/.kaggle
RUN chmod 600 /root/.kaggle/kaggle.json
