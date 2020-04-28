FROM python:3.8.1-alpine3.11 as builder
RUN apk add --update --no-cache \
    build-base \
    g++ \
    libc-dev \
    ca-certificates \
    py3-lxml \
    python3-dev \
    openssl-dev \
    libevent-dev \
    libffi-dev \
    libxslt-dev \
    libxml2-dev

WORKDIR /install

RUN pip install --prefix="/install" --no-warn-script-location \
    napalm \
    python-gitlab \
    pynetbox

FROM python:3.8.2-alpine3.11

RUN apk add --no-cache \
    bash \
    sshpass \
    ca-certificates \
    git \
    openssl \
    libevent \
    libffi \
    libxslt \
    libxml2

# copy the python dependencies
COPY --from=builder /install /usr/local
