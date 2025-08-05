#!/bin/bash
set -e

echo "🚀 Starting Jekyll build process..."

# Install dependencies
echo "📦 Installing Ruby dependencies..."
bundle install --jobs 4 --retry 3

# Build the site
echo "🔨 Building Jekyll site..."
bundle exec jekyll build

echo "✅ Build completed successfully!"
echo "📁 Site built in _site/ directory" 