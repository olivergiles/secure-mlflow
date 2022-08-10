FROM python:3.8.13-slim-buster

COPY ./requirements.txt ./requirements.txt

ARG DEBIAN_FRONTEND=noninteractive

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install --no-install-recommends supervisor nginx build-essential python3-dev libpq-dev apache2-utils gettext \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip install --no-cache-dir -r requirements.txt \
  && addgroup --gid 1000 www \
  && adduser --uid 1000 --shell /bin/sh -G www www

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./entry-point.sh /app/entry-point.sh

COPY nginx.conf.template /app/nginx.conf.template
COPY ./nginx.sh /app/nginx.sh

COPY ./mlflow.sh /app/mlflow.sh

CMD ["/bin/bash", "/app/entry-point.sh"]
