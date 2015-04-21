FROM ruby:2.2

MAINTAINER Maciej Lotkowski <maciej.lotkowski@gmail.com>

RUN gem install rest_client
RUN gem install syncano --pre

ENV API_ROOT https://v4.hydraengine.com

WORKDIR /tmp
RUN gem install syncano --pre

RUN chmod 1777 /tmp
# create a special user to run code
# user without root privileges greatly improves security
RUN groupadd -r syncano && useradd -r -g syncano syncano
USER syncano
