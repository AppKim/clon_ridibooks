FROM ruby:3.1.1-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN apk add --no-cache \
    alpine-sdk \
    build-base \
    sqlite-dev \
    mysql-client \
    mysql-dev \
    tzdata \
    libxml2-dev \
    libxslt-dev \
    libc6-compat

RUN mkdir /app
ENV APP_ROOT /app
ENV TZ=Asia/Tokyo

WORKDIR $APP_ROOT
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install