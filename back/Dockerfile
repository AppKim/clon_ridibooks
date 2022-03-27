FROM ruby:3.1.1

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    libpq-dev \        
    nodejs \
    && rm -rf /var/lib/apt/lists/* 

RUN mkdir /app
ENV APP_ROOT /app
ENV TZ=Asia/Tokyo

WORKDIR $APP_ROOT
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
