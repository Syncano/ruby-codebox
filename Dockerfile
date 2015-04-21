FROM ruby:2.2

MAINTAINER Maciej Lotkowski <maciej.lotkowski@gmail.com>

RUN apt-get install git

RUN gem install rest_client
RUN gem install syncano --pre

ENV API_ROOT https://v4.hydraengine.com

WORKDIR /tmp
RUN git clone https://github.com/Syncano/syncano-ruby.git && cd syncano-ruby && git checkout release/4.0
RUN gem install bundler -v 1.7
RUN (cd syncano-ruby ;  bundle install)

RUN chmod 1777 /tmp
# create a special user to run code
# user without root privileges greatly improves security
RUN groupadd -r syncano && useradd -r -g syncano syncano
USER syncano
