FROM 3.8.2-alpine3.11
RUN apk add --no-cache \
    bash \
    git
RUN pip install \
    napalm \
    python-gitlab \
    pynetbox
