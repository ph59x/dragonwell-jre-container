FROM ubuntu:22.04

ENV JAVA_VERSION jre-17.0.9.0.10+9

RUN apt-get update && apt-get install -y curl && \
    cd /tmp && \
    curl -LfsSo /tmp/openjdk.tar.gz \
        https://github.com/dragonwell-project/dragonwell17/releases/download/dragonwell-standard-17.0.9.0.10%2B9_jdk-17.0.9-ga/Alibaba_Dragonwell_Standard_17.0.9.0.10.9_x64_linux.tar.gz \
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
