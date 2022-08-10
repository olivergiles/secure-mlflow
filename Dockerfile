FROM python:3.8.13-slim-buster

COPY ./ ./

ARG DEBIAN_FRONTEND=noninteractive

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install --no-install-recommends supervisor nginx build-essential python3-dev libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip install --no-cache-dir -r requirements.txt \
  && addgroup -gid 1000 www \
  && adduser -uid 1000 -H -D -s /bin/sh -G www www

CMD ["/bin/bash", "/app/entry-point.sh"]
