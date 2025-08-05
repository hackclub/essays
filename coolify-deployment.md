# Coolify Deployment Guide

This guide will help you deploy your Jekyll site using Coolify.

## Prerequisites

1. A Coolify instance running (self-hosted or cloud)
2. Your Jekyll site code in a Git repository (GitHub, GitLab, etc.)
3. Docker installed on your Coolify server

## Deployment Steps

### 1. Prepare Your Repository

Your repository should now contain:
- `Dockerfile` - Multi-stage build for Jekyll + Nginx
- `.dockerignore` - Excludes unnecessary files
- `docker-compose.yml` - For local testing
- All your Jekyll files (`_config.yml`, `Gemfile`, `_essays/`, etc.)

### 2. Coolify Setup

1. **Login to your Coolify dashboard**
2. **Create a new project**
   - Click "New Project"
   - Choose "Application"
   - Select your Git repository

3. **Configure the application**
   - **Build Pack**: Docker
   - **Docker Image**: Leave empty (will use Dockerfile)
   - **Port**: 80
   - **Branch**: main (or your default branch)

4. **Environment Variables** (if needed)
   - Add any environment-specific variables
   - For Jekyll, you might want:
     ```
     JEKYLL_ENV=production
     ```

5. **Deploy**
   - Click "Deploy" to start the build process
   - Coolify will:
     - Clone your repository
     - Build the Docker image using your Dockerfile
     - Deploy the container
     - Set up networking and routing

### 3. Custom Domain (Optional)

1. **Add a custom domain** in Coolify
2. **Configure DNS** to point to your Coolify instance
3. **SSL certificate** will be automatically provisioned by Coolify

### 4. Monitoring

- **Logs**: View build and runtime logs in Coolify dashboard
- **Health checks**: Monitor application health
- **Auto-deploy**: Enable automatic deployments on Git pushes

## Local Testing

Before deploying to Coolify, test locally:

```bash
# Build and run locally
docker-compose up --build

# Visit http://localhost:8080
```

## Troubleshooting

### Common Issues

1. **Build fails**: Check Dockerfile syntax and dependencies
2. **Port conflicts**: Ensure port 80 is available
3. **Memory issues**: Jekyll build might need more memory for large sites

### Debug Commands

```bash
# Test Docker build locally
docker build -t jekyll-site .

# Run container locally
docker run -p 8080:80 jekyll-site

# Check container logs
docker logs <container-id>
```

## Performance Optimization

- The multi-stage Dockerfile reduces final image size
- Nginx serves static files efficiently
- Consider adding caching headers in nginx.conf if needed

## Updates

To update your site:
1. Push changes to your Git repository
2. Coolify will automatically rebuild and deploy (if auto-deploy is enabled)
3. Or manually trigger a new deployment from the dashboard 