FROM abiosoft/caddy:1.0.3-no-stats

WORKDIR /tmp

ENV HUGO_VERSION 0.73.0

RUN wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
    tar -xvzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv ./hugo /usr/bin/

RUN rm -rf * && \
    mkdir /data
