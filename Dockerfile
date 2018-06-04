FROM ruby:2.4-slim-stretch

RUN apt-get update && apt-get install git -y

RUN gem install danger-gitlab danger-mention danger-slack danger-commit_lint --no-document

