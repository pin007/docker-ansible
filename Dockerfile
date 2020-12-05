FROM python:3.9-alpine

COPY src/requirements.txt /requirements.txt

RUN apk add --no-cache busybox-extras openssh-client

RUN apk add --no-cache --virtual .docker gcc py3-setuptools python3-dev musl-dev libffi-dev libressl-dev && \
    pip3 --no-cache-dir install -r /requirements.txt && \
    apk del .docker

RUN mkdir /ansible

WORKDIR /ansible

CMD /bin/sh
