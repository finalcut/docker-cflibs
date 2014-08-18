FROM ubuntu:latest
MAINTAINER finalcut bill@rawlinson.us

ENV REFRESHED_AT 2014_08_18_1
RUN apt-get update
RUN apt-get install -y unzip

ADD  https://github.com/markmandel/coldspring/archive/2.0-alpha1.tar.gz /var/cflibs/coldspring.tar.gz
ADD https://github.com/downloads/mxunit/mxunit/mxunit-2.1.3.zip /var/cflibs/mxunit.zip
ADD https://github.com/framework-one/fw1/archive/v2.5.tar.gz /var/cflibs/fw1.tar.gz

WORKDIR /var/cflibs
RUN tar -xzf coldspring.tar.gz
RUN mv coldspring-2.0-alpha1/coldspring coldspring
RUN rm -Rf coldspring-2.0-alpha1
RUN tar -xzf fw1.tar.gz
RUN mv fw1-2.5 fw1
RUN rm fw1.tar.gz
RUN unzip -qq  mxunit.zip
RUN rm coldspring.tar.gz
RUN rm mxunit.zip
VOLUME /var/cflibs

CMD ["/bin/sh"]
