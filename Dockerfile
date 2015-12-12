FROM kurron/docker-jetbrains-base:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="Spring Tool Suite" org.kurron.ide.version=3.7.2

ADD http://dist.springsource.com/release/STS/3.7.2.RELEASE/dist/e4.5/spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz /tmp/ide.tar.gz

RUN mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    ln -s /usr/lib/jvm/jdk1.8.0_65/jre /opt/ide/sts-3.7.2.RELEASE/jre && \
    chown -R developer:developer /opt/ide && \
    rm /tmp/ide.tar.gz && \
    apt-get update && \
    apt-get install -y libxslt1.1 && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/opt/ide/sts-3.7.2.RELEASE/STS"]
