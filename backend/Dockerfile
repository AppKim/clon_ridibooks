FROM ruby:3.1.1-alpine

RUN apk add \
    alpine-sdk \
    build-base \
    sqlite-dev \
    mysql-client \
    mysql-dev \
    tzdata \
    git
    
RUN mkdir /app
ENV APP_ROOT /app
ENV TZ=Asia/Tokyo

WORKDIR $APP_ROOT
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
