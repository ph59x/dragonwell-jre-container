FROM alpine:3.18

ENV JAVA_VERSION jre-11.0.20.16+8

RUN apk add --no-cache ca-certificates musl-locales musl-locales-lang openssl wget && \
    wget --no-verbose \
        -O /tmp/openjdk.tar.gz \
        https://github.com/dragonwell-project/dragonwell11/releases/download/dragonwell-standard-11.0.20.16_jdk-11.0.20-ga/Alibaba_Dragonwell_Standard_11.0.20.16.8_x64_alpine-linux.tar.gz \
    && \
    mkdir -p /tmp/export &&\
    tar --extract \
        --file /tmp/openjdk.tar.gz \
        --directory /tmp/export \
        --strip-components 1 \
        --no-same-owner \
    && \
    /tmp/export/bin/jlink \
        --module-path /tmp/export/jmods \
        --add-modules ALL-MODULE-PATH \
        --compress=1 \
        --output /opt/java/jre \
    && \
    rm -rf /tmp/openjdk.tar.gz && \
    rm -rf /tmp/export && \
    apk del wget && \
    rm -rf /var/cache/apk/*

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/jre/bin:$PATH"
