FROM ruby:2.1.6
ENV APP_ROOT /usr/src/app

RUN apt-get update && apt-get install -y nodejs mysql-client cmake libicu-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

ENV LODGE_VERSION=develop
RUN curl -L https://github.com/lodge/lodge/archive/$LODGE_VERSION.tar.gz | tar xz --strip-components=1 -C $APP_ROOT

COPY database.yml $APP_ROOT/config/

RUN \
  bundle config --local without test development doc && \
  bundle install -j4

RUN rake emoji
RUN rake acts_as_taggable_on_engine:install:migrations

EXPOSE 3000

# CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
