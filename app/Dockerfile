FROM jupyter/base-notebook:python-3.9.12

USER root

COPY install-packages.sh .
RUN ./install-packages.sh && rm -R ./install-packages.sh

COPY requirements.txt /tmp/
RUN pip install --upgrade pip setuptools wheel && pip install --no-cache-dir -r /tmp/requirements.txt

COPY ./kaggle ./.kaggle
RUN chmod 600 ./.kaggle/kaggle.json