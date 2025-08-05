# Use the official Ruby image as base
FROM ruby:3.2-alpine

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    gcc \
    musl-dev \
    libffi-dev \
    git

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle config set --local deployment 'true' \
    && bundle config set --local path 'vendor/bundle' \
    && bundle install --jobs 4 --retry 3

# Copy the rest of the application
COPY . .

# Build the Jekyll site
RUN bundle exec jekyll build

# Use nginx to serve the static files
FROM nginx:alpine

# Copy the built site to nginx
COPY --from=0 /app/_site /usr/share/nginx/html

# Copy custom nginx configuration if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 