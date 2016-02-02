FROM centos
MAINTAINER Joshi Friberg

WORKDIR /opt
COPY ./Symform.rpm Symform.rpm
# Custom startupscript
COPY ./entrypoint.sh entrypoint.sh
RUN yum install -y cronie
RUN yum localinstall -y Symform.rpm

# Setup webgui
EXPOSE 59234/tcp 42666/tcp

RUN rm -rf Symform.rpm
RUN chmod a+x ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh
