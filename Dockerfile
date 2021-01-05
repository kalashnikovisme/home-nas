FROM ruby:2.7.1
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
ENV RAILS_ENV $RAILS_ENV

ARG BUNDLE_ENV="--without development test"
ENV BUNDLE_ENV ${BUNDLE_ENV}

ENV PG_USER $PG_USER
ENV PG_HOST $PG_HOST
COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock
RUN gem install rake -v '12.3.2' --source 'https://rubygems.org/'
RUN bundle install ${BUNDLE_ENV} --jobs 20 --path=vendor/
COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
