FROM alpine:3.10

ENV LANG='en_US.UTF-8'
ENV LANGUAGE='en_US:en'
ENV LC_ALL='en_US.UTF-8'
ENV JAVA_HOME=/opt/java/openjdk/jre
ENV JAVA_VERSION_MAJOR=$java_version_major
ENV JAVA_VERSION_MINOR=$java_version_minor
ENV JAVA_VERSION_BUILD=$java_version_build
ENV NEWRELIC_VERSION=5.3.0
ENV PATH=/opt/java/openjdk/jre/bin:$PATH

RUN apk -U upgrade && apk add --update openssl

RUN mkdir -p /opt/java/openjdk \
    && wget --tries 5 --output-document /tmp/openjdk.tar.gz -S https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/OpenJDK8U-jdk_x64_linux_hotspot_${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}b${JAVA_VERSION_BUILD}.tar.gz \
    && tar -xzf /tmp/openjdk.tar.gz --strip-components=1 -C /opt/java/openjdk \
    && rm -rf /tmp/openjdk.tar.gz \
    && rm -rf /opt/java/openjdk/src.zip \
    && rm -rf /opt/java/openjdk/ASSEMBLY_EXCEPTION \
    && rm -rf /opt/java/openjdk/LICENSE \
    && rm -rf /opt/java/openjdk/THIRD_PARTY_README \
    && rm -rf /opt/java/openjdk/demo/ \
    && rm -rf /opt/java/openjdk/man/ \
    && rm -rf /opt/java/openjdk/sample/ \
    && rm -rf /opt/java/openjdk/bin/ \
    && rm -rf /opt/java/openjdk/include/ \
    && rm -rf /opt/java/openjdk/lib/ \
    && rm -rf /opt/java/openjdk/release \
    && rm -rf /opt/java/openjdk/jre/THIRD_PARTY_README \
    && java -version

RUN mkdir -p /opt/newrelic \
    && wget --tries 5 --output-document /opt/newrelic/newrelic.jar https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-agent.jar
