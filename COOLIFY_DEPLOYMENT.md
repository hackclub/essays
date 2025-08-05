# Coolify Deployment Guide for Jekyll Site

## Overview
This guide covers deploying your Jekyll site to Coolify using nixpacks build system.

## Files Added/Modified
- `nixpacks.toml` - Build configuration for nixpacks
- `.nixpacks` - Ruby version specification
- `Procfile` - Process definition for running the app
- `coolify-config.json` - Updated Coolify configuration
- `.ruby-version` - Ruby version specification

## Deployment Steps

### 1. Push Changes to Git
```bash
git add .
git commit -m "Add nixpacks configuration for Coolify deployment"
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
3. Install Jekyll dependencies
4. Build the Jekyll site
5. Start the server on port 4000

## Troubleshooting

### If you still get Bundler errors:
1. Check that `.ruby-version` contains `3.2.0`
2. Verify `nixpacks.toml` specifies Bundler 2.4.22
3. Ensure all files are committed and pushed

### If the site doesn't load:
1. Check Coolify logs for any startup errors
2. Verify the port is set to 4000 in Coolify
3. Check that the health check path is `/`

### Alternative: Use Docker Build
If nixpacks continues to fail, you can switch back to Docker:
1. In Coolify, set **Build Pack** to `docker`
2. Ensure `Dockerfile` is present in your repository
3. Set port to `80`

## Local Testing
To test the nixpacks build locally:
```bash
# Install nixpacks (if you have it)
nixpacks build .
```

## Expected Build Output
The build should show:
- Ruby 3.2.0 installation
- Bundler 2.4.22 installation
- Jekyll dependencies installation
- Jekyll site build
- Server startup on port 4000 