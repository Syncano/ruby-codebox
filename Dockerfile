FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2016-03-25
ENV SYNCANO_APIROOT https://api.syncano.io/

RUN groupadd -r syncano && \
    useradd -u 1000 -r -g syncano syncano -d /tmp -s /bin/bash && \
    mkdir /home/syncano && \
    chown -R syncano /home/syncano

# enable everyone to use /tmp
RUN chmod 1777 /tmp
# -- CUT BEGIN --

ENV API_ROOT https://api.syncano.io
# make sure the package repository is up to date
# install python-software-properties (so you can do add-apt-repository)
RUN apt-get update && apt-get install -qqy \
    python-software-properties \
    software-properties-common

# add brightbox's repo, for ruby2.2
RUN apt-add-repository ppa:brightbox/ruby-ng

RUN apt-get -y update && apt-get install -qqy \
    ruby2.2 \
    ruby2.2-dev \
    bundler \
    javascript-common

RUN gem install rest_client && \
    gem install syncano --pre && \
    gem install mailgun-ruby && \
    gem install pdf-reader && \
    gem install net-sftp

# -- CUT END --
USER syncano
WORKDIR /tmp
CMD "irb"
