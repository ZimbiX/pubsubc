# Here we declare a base ruby image that we'll use as a base image for all the
# other stages in our Dockerfile.
#
# We install libpq-dev in this stage, because it's required everywhere.
#
# To see if there's a new image available, run "docker pull
# ruby:2.6.5-slim-buster" and inspect the image digest.
#
# If you update the minor or patch versions, you should also update the .tool-versions file.
#
# Also see https://hub.docker.com/_/ruby
FROM ruby:2.6.5-slim-buster@sha256:7e0fab6fbb9c47713cad699d41c8d22e217141d6ca3d35e76b5dc5a0658820ff \
  AS ruby-base

ENV RUBY_BUNDLER_VERSION '2.2.15'
ENV BUNDLE_PATH /usr/local/bundle

RUN apt-get update \
  && apt-get install -y --no-install-recommends libpq-dev \
  && rm -rf /var/lib/apt/lists/*

### dev-environment
FROM ruby-base AS dev-environment

RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential curl git \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v ${RUBY_BUNDLER_VERSION}
