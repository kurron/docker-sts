FROM kurron/docker-jetbrains-base:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="logFaces client" org.kurron.ide.version=4.2.1

ADD http://www.moonlit-software.com/logfaces/downloads/lfc.4.2.1.linux.gtk.x86_64.tar.gz /tmp/ide.tar.gz

RUN mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    rm /tmp/ide.tar.gz

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/opt/ide/logfaces"]
