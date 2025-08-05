# This is a placeholder Dockerfile that will be overwritten by nixpacks
FROM ruby:3.2-slim

WORKDIR /app
COPY . .

RUN bundle install
RUN bundle exec jekyll build

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"] 