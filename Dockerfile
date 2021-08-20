FROM mhart/alpine-node:12 as base

RUN apk add --no-cache wget tar

RUN npm install

RUN export PANDOC_VERSION=2.7.3 \
   && cd /tmp \
   && wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz \
   && tar -xvzf pandoc-${PANDOC_VERSION}-linux.tar.gz \
   && mv ./pandoc-${PANDOC_VERSION}/bin/* /usr/bin \
   && rm -rf ./pandoc-${PANDOC_VERSION} pandoc-${PANDOC_VERSION}-linux.tar.gz

RUN apk del wget tar && rm -vrf /var/cache/apk/*
