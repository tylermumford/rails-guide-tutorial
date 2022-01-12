# Based on https://docs.docker.com/samples/rails/
FROM ruby:3.1

RUN apt-get update -qq && apt-get install -y nodejs npm sqlite3
RUN npm i -g corepack
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
