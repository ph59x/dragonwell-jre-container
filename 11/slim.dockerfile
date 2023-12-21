FROM debian:12-slim

ENV JAVA_VERSION jre-11.0.20.16+8

RUN apt-get update && apt-get install -y curl && \
    cd /tmp && \
    curl -LfsSo /tmp/openjdk.tar.gz \
        https://github.com/dragonwell-project/dragonwell11/releases/download/dragonwell-standard-11.0.20.16_jdk-11.0.20-ga/Alibaba_Dragonwell_Standard_11.0.20.16.8_x64_linux.tar.gz \
    && \
    mkdir -p /tmp/openjdk && cd /tmp/openjdk && \
    tar -zxf /tmp/openjdk.tar.gz --strip-components=1 && \
    /tmp/openjdk/bin/jlink \
        --module-path /tmp/openjdk/jmods \
        --add-modules ALL-MODULE-PATH \
        --compress=1 \
        --output /opt/java/jre \
    && \
    rm -rf /tmp/openjdk.tar.gz && rm -rf /tmp/openjdk && \
    apt-get purge -y curl && apt-get autoremove -y && apt-get clean

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/jre/bin:$PATH"
