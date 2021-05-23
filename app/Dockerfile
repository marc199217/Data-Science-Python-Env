FROM python:3.9-slim-buster

COPY install-packages.sh .
RUN ./install-packages.sh

COPY requirements.txt /tmp/
RUN pip install --upgrade pip && pip install --no-cache-dir -r /tmp/requirements.txt

COPY ./dev /root/.kaggle
RUN chmod 600 /root/.kaggle/kaggle.json
#RUN groupadd --gid 5000 marcnordbruch \
#    && useradd --home-dir /home/marcnordbruch --create-home --uid 5000 \
#    --gid 5000 --shell /bin/bash --skel /dev/null marcnordbruch \
#    && echo "marcnordbruch:giga//games" | chpasswd
#USER marcnordbruch

CMD ["python"]