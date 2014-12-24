FROM tutum/apache-php
MAINTAINER nacyot<propellerheaven@gmail.com>

RUN apt-get update
RUN apt-get install -y wget

# Install Textcube
WORKDIR /opt
RUN wget https://github.com/Needlworks/Textcube/archive/v1.9.3.tar.gz && \
      tar xvf v1.9.3.tar.gz && \
      rm -rf /app && \
      mkdir -p /app && \
      mv Textcube-1.9.3 /app/blog
RUN \
  chmod 0777 /app/blog /app/blog/skin/blog &&\
  chmod 0755 /app/blog

ADD ./files/apache2.conf /etc/apache2/apache2.conf
ADD ./files/000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN a2enmod rewrite
