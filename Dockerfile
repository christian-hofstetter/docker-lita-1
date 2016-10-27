FROM ruby:2.3-alpine

WORKDIR /app

RUN apk add --no-cache git curl supervisor libxml2 libxslt 

ADD ./Gemfile /app/
ADD ./Gemfile.lock /app/

RUN apk add --no-cache --virtual bundle-build libxml2-dev libxslt-dev build-base && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install --without development test && \
    apk del bundle-build

ADD supervisord.conf /etc/supervisor.d/lita.ini
ADD ./ /app

ENTRYPOINT /app/start.sh

