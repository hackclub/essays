# Essays

Yaps, blabs, and scribbles authored by the people of Hack Club.

## About

This is a Jekyll-powered blog for hosting markdown-formatted essays. It features a clean, modern design that's fully responsive and optimized for reading.

## Setup

### Prerequisites

- Ruby (version 2.6 or higher)
- Bundler gem

### Installation

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Start the development server:
   ```bash
   bundle exec jekyll serve
   ```

3. Visit `http://localhost:4000` to view your blog

## Adding Essays

To add a new essay:

1. Create a new markdown file in the `_essays` folder
2. Add the following front matter at the top of the file:

```yaml
---
layout: post
title: "Your Essay Title"
author: "Your Name"
date: YYYY-MM-DD
excerpt: "A brief description of your essay"
---
```

3. Write your essay content in markdown below the front matter
4. Save the file and the essay will automatically appear on your blog

## Features

- **Clean Design**: Modern, responsive layout optimized for reading
- **Markdown Support**: Full markdown support with syntax highlighting
- **Collections**: Essays are organized using Jekyll collections
- **SEO Optimized**: Built-in SEO tags and meta descriptions
- **RSS Feed**: Automatic RSS feed generation
- **Mobile Friendly**: Fully responsive design

## Customization

- **Styling**: Edit `assets/css/style.css` to customize the appearance
- **Layout**: Modify files in `_layouts/` to change the page structure
- **Configuration**: Update `_config.yml` to change site settings

## Deployment

The site can be deployed to GitHub Pages, Netlify, or any static hosting service. Simply build the site with:

```bash
bundle exec jekyll build
```

The generated site will be in the `_site` folder.

## License

This project is licensed under the MIT License - see the LICENSE file for details.