FROM ruby:2.4-slim-stretch

RUN gem install danger-gitlab danger-mention danger-slack --no-document

