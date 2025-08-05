# Coolify Deployment Guide for Jekyll Site

## Overview
This guide covers deploying your Jekyll site to Coolify using nixpacks build system.

## Files Added/Modified
- `nixpacks.toml` - Build configuration for nixpacks
- `.nixpacks` - Ruby version and build specification
- `Procfile` - Process definition for running the app
- `coolify-config.json` - Updated Coolify configuration
- `.ruby-version` - Ruby version specification

## Important Notes
- **Docker files removed**: The existing Dockerfile, Dockerfile.simple, and docker-compose.yml have been removed to avoid conflicts with nixpacks
- **nixpacks only**: This configuration uses nixpacks exclusively for building and deploying

## Deployment Steps

### 1. Push Changes to Git
```bash
git add .
git commit -m "Remove Docker files and configure nixpacks for Coolify deployment"
git push origin main
```

### 2. Configure Coolify
1. Go to your Coolify dashboard
2. Create a new application or update existing one
3. Connect your Git repository
4. Set the following configuration:
   - **Build Pack**: `nixpacks` (should auto-detect)
   - **Port**: `4000`
   - **Branch**: `main`

### 3. Environment Variables (Optional)
Add these environment variables in Coolify:
- `JEKYLL_ENV`: `production`
- `NODE_ENV`: `production`

### 4. Deploy
Click "Deploy" in Coolify. The build process will:
1. Install Ruby 3.2.0
2. Install Bundler 2.4.22 (compatible with Ruby 3.2)
3. Install Jekyll dependencies in vendor/bundle
4. Build the Jekyll site
5. Start the server on port 4000

## Troubleshooting

### If you get "Not a directory" errors:
1. Ensure no Dockerfile exists in your repository
2. Check that nixpacks.toml and .nixpacks are properly configured
3. Verify all files are committed and pushed

### If you still get Bundler errors:
1. Check that `.ruby-version` contains `3.2.0`
2. Verify `nixpacks.toml` specifies Bundler 2.4.22
3. Ensure all files are committed and pushed

### If the site doesn't load:
1. Check Coolify logs for any startup errors
2. Verify the port is set to 4000 in Coolify
3. Check that the health check path is `/`

## Expected Build Output
The build should show:
- Ruby 3.2.0 installation
- Bundler 2.4.22 installation
- Jekyll dependencies installation in vendor/bundle
- Jekyll site build
- Server startup on port 4000

## Local Testing
Your local Jekyll server should continue to work as before:
```bash
bundle exec jekyll serve
``` 