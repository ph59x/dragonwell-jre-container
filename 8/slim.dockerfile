FROM debian:12-slim

ENV JAVA_VERSION jdk8u382-b01

RUN apt-get update && apt-get install -y curl && \
    cd /tmp && \
    curl -LfsSo /tmp/openjdk.tar.gz https://github.com/dragonwell-project/dragonwell8/releases/download/dragonwell-standard-8.16.17_jdk8u382-ga/Alibaba_Dragonwell_Standard_8.16.17_x64_linux.tar.gz && \
    mkdir -p /tmp/openjdk && cd /tmp/openjdk && \
    tar -zxf /tmp/openjdk.tar.gz --strip-components=1 && \
    mkdir -p /opt/java/jre && \
    mv /tmp/openjdk/jre /opt/java/ && \
    rm -rf /tmp/openjdk.tar.gz && rm -rf /tmp/openjdk && \
    apt-get purge -y curl && apt-get autoremove -y && apt-get clean

ENV JAVA_HOME=/opt/java/jre \
    PATH="/opt/java/jre/bin:$PATH"
