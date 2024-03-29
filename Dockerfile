FROM alpine:3.14
MAINTAINER daniele@smartango.com

RUN apk --update add \
    bash \
    iptables \
    ca-certificates \
    e2fsprogs \
    openssh-client \
    git \
    curl \
    rust \
    cargo \
    docker \
    py-pip \
    python3-dev \
    libffi-dev \
    openssl-dev \
    gcc \
    libc-dev \
    make \
    && pip install docker-compose \
    && rm -rf /var/cache/apk/* \
    && addgroup --gid 1000 dcind \
    && adduser --disabled-password \
    --ingroup dcind \
    --home /home/dcind \
    --no-create-home \
    dcind \
    && addgroup --gid 140 docker1 \
    && addgroup dcind docker1 \
    && addgroup dcind ping


USER dcind

CMD ["top", "-b"]
