# Coolify Deployment Guide for Jekyll Site

## Overview
This guide covers deploying your Jekyll site to Coolify using a static build approach.

## Files Added/Modified
- `build.sh` - Build script for Jekyll site
- `coolify-config.json` - Updated Coolify configuration for static builds
- `.ruby-version` - Ruby version specification

## Important Notes
- **Static Build**: This configuration uses a static build approach instead of nixpacks to avoid Dockerfile conflicts
- **Simple Server**: Uses Python's built-in HTTP server to serve the static files
- **No Docker**: Eliminates all Docker-related complexity

## Deployment Steps

### 1. Push Changes to Git
```bash
git add .
git commit -m "Switch to static build approach for Coolify deployment"
git push origin main
```

### 2. Configure Coolify
1. Go to your Coolify dashboard
2. Create a new application or update existing one
3. Connect your Git repository
4. Set the following configuration:
   - **Build Pack**: `static`
   - **Port**: `4000`
   - **Branch**: `main`
   - **Build Command**: `./build.sh`
   - **Start Command**: `./serve.sh`
   - **Output Directory**: `_site`

### 3. Environment Variables (Optional)
Add these environment variables in Coolify:
- `JEKYLL_ENV`: `production`
- `NODE_ENV`: `production`

### 4. Deploy
Click "Deploy" in Coolify. The build process will:
1. Run the build script to install dependencies
2. Build the Jekyll site
3. Create a simple HTTP server script
4. Serve the static files on port 4000

## Troubleshooting

### If you get build errors:
1. Check that `build.sh` is executable (`chmod +x build.sh`)
2. Verify Ruby and Bundler are available in the build environment
3. Check Coolify logs for specific error messages

### If the site doesn't load:
1. Check Coolify logs for any startup errors
2. Verify the port is set to 4000 in Coolify
3. Check that the health check path is `/`

## Expected Build Output
The build should show:
- Ruby dependencies installation
- Jekyll site build
- Static files generated in _site/
- Simple HTTP server startup

## Local Testing
Your local Jekyll server should continue to work as before:
```bash
bundle exec jekyll serve
```

## Alternative: Manual Static Deployment
If the build approach still fails, you can:
1. Build locally: `bundle exec jekyll build`
2. Upload the `_site/` directory to a static hosting service
3. Configure Coolify to serve static files directly 