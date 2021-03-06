FROM ruby:2.5.5

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs

WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile* /app/

# Speed up nokogiri install
ENV NOKOGIRI_USE_SYSTEM_LIBRARIES 1

RUN bundle install

# Copy the Rails application into place
COPY . /app

# Precompile assets here, so we don't have to do it inside a container + restart
RUN bin/rake assets:precompile

#CMD [ "bundle", "exec", "puma" ]
CMD [ "rails", "server", "-p", "3000", "-b", "0.0.0.0" ]
