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

# Create a simple server script for static hosting
cat > serve.sh << 'EOF'
#!/bin/bash
cd _site
python3 -m http.server ${PORT:-4000}
EOF

chmod +x serve.sh 