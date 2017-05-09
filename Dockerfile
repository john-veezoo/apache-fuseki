############################################################
# Dockerfile to build Apache Fuseki container images
# Based on Ubuntu
############################################################

# Set the base image to java 8 alpine
FROM java:8-jre-alpine

# File Author / Maintainer
MAINTAINER JPedro Monteiro

################## BEGIN INSTALLATION ######################
# Install Apache Fuseki Following the Instructions at Apache Fuseki Docs
# Ref: https://jena.apache.org/download/index.cgi

RUN wget http://mirror.switch.ch/mirror/apache/dist/jena/binaries/apache-jena-fuseki-2.5.0.zip
RUN unzip apache-jena-fuseki-2.5.0.zip
RUN rm apache-jena-fuseki-2.5.0.zip
RUN mv apache-jena-fuseki-2.5.0 fuseki
RUN mkdir fuseki/run

##################### INSTALLATION END #####################

# Expose the default port
EXPOSE 3030

VOLUME /fuseki

WORKDIR /fuseki

# Set default container command
ENTRYPOINT ./fuseki-server