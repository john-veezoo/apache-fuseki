############################################################
# Dockerfile to build Apache Fuseki container images
# Based on Ubuntu
############################################################

# Set the base image to java 8 alpine
FROM openjdk:9

# File Author / Maintainer
MAINTAINER JPedro Monteiro

################## BEGIN INSTALLATION ######################
# Install Apache Fuseki Following the Instructions at Apache Fuseki Docs
# Ref: https://jena.apache.org/download/index.cgi

RUN wget -r --no-parent -e robots=off -A 'apache-jena-fuseki-*.zip' http://mirror.switch.ch/mirror/apache/dist/jena/binaries/
RUN unzip mirror.switch.ch/mirror/apache/dist/jena/binaries/apache-jena-fuseki-*.zip
RUN rm -fr mirror.switch.ch
RUN mv apache-jena-fuseki-* fuseki 
RUN mkdir fuseki/run

##################### INSTALLATION END #####################

# Expose the default port
EXPOSE 3030

VOLUME /fuseki

WORKDIR /fuseki

# Set default container command
ENTRYPOINT ./fuseki-server
