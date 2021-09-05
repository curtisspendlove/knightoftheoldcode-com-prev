FROM ruby:3.0

LABEL maintainer="curtis.spendlove@knightoftheoldcode.com"

RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    nodejs \
    git

COPY Gemfile* /usr/src/site/
WORKDIR /usr/src/site
RUN bundle install

COPY . /usr/src/site/

CMD [ "jekyll", "serve", "--host=0.0.0.0" ]
