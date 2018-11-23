FROM ruby:2.4.5

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

#CMD [ "bundle", "exec", "puma" ]
CMD [ "rails", "server", "-b", "3000" ]
