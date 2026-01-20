# Deployment Checklist for Early Bloom 🚀

Use this checklist when preparing to deploy Early Bloom to production.

## Pre-Deployment

### 1. Environment Setup

- [ ] Choose hosting platform (Heroku, Render, Fly.io, Railway, etc.)
- [ ] Set up PostgreSQL database (production)
- [ ] Configure environment variables
  - [ ] `SECRET_KEY_BASE` (run `bin/rails secret`)
  - [ ] `DATABASE_URL` (provided by hosting platform)
  - [ ] `RAILS_ENV=production`
  - [ ] `RAILS_LOG_TO_STDOUT=true`
  - [ ] Optional: AI API keys if implementing AI features

### 2. Code Preparation

- [ ] Remove or update development-specific code
- [ ] Update `config/database.yml` for production
- [ ] Configure `config/environments/production.rb`
  - [ ] Set proper `config.hosts` if needed
  - [ ] Configure action_mailer settings (for future emails)
- [ ] Add production gems if needed
  ```ruby
  # Gemfile
  group :production do
    gem 'pg'  # Already included
  end
  ```

### 3. Security Checklist

- [ ] Ensure `.env` is in `.gitignore` (never commit secrets)
- [ ] Use environment variables for all secrets
- [ ] Enable HTTPS/SSL in production
- [ ] Configure Content Security Policy if needed
- [ ] Review `config/credentials.yml.enc` usage
- [ ] Set strong `SECRET_KEY_BASE`
- [ ] Review CORS settings if building API later

### 4. Database

- [ ] Run migrations on production: `bin/rails db:migrate`
- [ ] **DO NOT** run `db:seed` in production (test data only!)
- [ ] Create first real user account manually or via console
- [ ] Set up database backups
- [ ] Configure connection pooling

### 5. Assets

- [ ] Precompile assets: `bin/rails assets:precompile`
- [ ] Verify Tailwind CSS is building correctly
- [ ] Verify JavaScript bundle is working
- [ ] Test on different browsers
- [ ] Test responsive design on mobile devices

### 6. Performance

- [ ] Enable production caching
- [ ] Set up CDN for assets (optional for MVP)
- [ ] Configure Redis for caching (optional for MVP)
- [ ] Review database query performance
- [ ] Add database indexes if needed (already done for foreign keys)

## Platform-Specific Instructions

### Deploying to Heroku

```bash
# Install Heroku CLI
brew tap heroku/brew && brew install heroku

# Login to Heroku
heroku login

# Create app
heroku create early-bloom

# Add PostgreSQL
heroku addons:create heroku-postgresql:mini

# Set environment variables
heroku config:set RAILS_ENV=production
heroku config:set SECRET_KEY_BASE=$(bin/rails secret)
heroku config:set RAILS_LOG_TO_STDOUT=true

# Deploy
git push heroku main

# Run migrations
heroku run bin/rails db:migrate

# Open app
heroku open

# View logs
heroku logs --tail
```

### Deploying to Render

1. Create account at render.com
2. Create new Web Service
3. Connect GitHub repository
4. Configure:
   - Build Command: `bundle install && yarn install && bin/rails assets:precompile`
   - Start Command: `bin/rails server -b 0.0.0.0`
   - Add PostgreSQL database
   - Set environment variables
5. Deploy automatically on git push

### Deploying to Fly.io

```bash
# Install flyctl
brew install flyctl

# Login
fly auth login

# Launch app
fly launch

# Deploy
fly deploy

# Run migrations
fly ssh console -C "bin/rails db:migrate"

# Open app
fly open
```

## Post-Deployment

### 1. Verify Functionality

- [ ] Test signup flow
- [ ] Test login flow
- [ ] Create child profile
- [ ] Create a post
- [ ] Add comment
- [ ] Add reaction
- [ ] View feed
- [ ] Test on mobile device
- [ ] Test on different browsers

### 2. Monitoring Setup

- [ ] Set up error tracking (Sentry, Rollbar, Honeybadger)
- [ ] Configure uptime monitoring (UptimeRobot, Pingdom)
- [ ] Set up application performance monitoring (optional)
- [ ] Configure log aggregation if needed

### 3. Email Configuration (for future)

- [ ] Choose email provider (SendGrid, Mailgun, Postmark)
- [ ] Configure action_mailer in production
- [ ] Set up email templates
- [ ] Test welcome emails
- [ ] Test password reset emails

### 4. Domain & SSL

- [ ] Purchase domain name
- [ ] Point DNS to hosting platform
- [ ] Configure SSL certificate (usually automatic)
- [ ] Force HTTPS in production
- [ ] Update `config.hosts` if needed

## Production Configuration Examples

### config/environments/production.rb

```ruby
Rails.application.configure do
  # Essential production settings
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  
  # Force SSL
  config.force_ssl = true
  
  # Logging
  config.log_level = :info
  config.log_tags = [:request_id]
  
  # Email (when ready)
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'earlybloom.com' }
  
  # Add your SMTP settings here when ready
end
```

### Procfile (for Heroku)

```
web: bin/rails server -p $PORT -e production
release: bin/rails db:migrate
```

### fly.toml (for Fly.io)

Generated automatically, verify settings:
- Set proper app name
- Configure health checks
- Set minimum instances to 1
- Configure auto-scaling if needed

## Rollback Plan

### If something goes wrong:

**Heroku:**
```bash
heroku releases
heroku rollback v[previous-version]
```

**Render:**
- Use dashboard to rollback to previous deploy

**Fly.io:**
```bash
fly releases
fly deploy --image [previous-image]
```

## First Production User

Create the first user via Rails console:

```bash
# Heroku
heroku run bin/rails console

# Render/Fly
# Use SSH or console feature in dashboard

# Create admin user
User.create!(
  name: "Admin",
  email: "admin@earlybloom.com",
  password: "secure_password_here",
  password_confirmation: "secure_password_here"
)
```

## Ongoing Maintenance

### Weekly
- [ ] Review error logs
- [ ] Check database performance
- [ ] Monitor user signups
- [ ] Review community content

### Monthly
- [ ] Update dependencies (`bundle update`)
- [ ] Security patches
- [ ] Database cleanup if needed
- [ ] Review hosting costs

### As Needed
- [ ] Scale dynos/instances based on traffic
- [ ] Upgrade database plan if needed
- [ ] Add features based on user feedback

## Common Issues & Solutions

### Assets not loading
```bash
# Ensure assets are precompiled
RAILS_ENV=production bin/rails assets:precompile

# Check public/assets directory exists
ls public/assets
```

### Database connection errors
- Verify DATABASE_URL is set correctly
- Check database is accessible from application
- Verify connection pool size in database.yml

### Turbo/Stimulus not working
- Check JavaScript console for errors
- Verify assets are compiled with esbuild
- Check Content Security Policy allows inline scripts if needed

### Slow page loads
- Enable caching in production
- Add database indexes
- Use eager loading (.includes) in queries
- Consider CDN for static assets

## Success Metrics to Track

After deployment, monitor:

- [ ] User signups per day/week
- [ ] Posts created per day
- [ ] Comments per post (engagement)
- [ ] Reactions per post
- [ ] Daily active users
- [ ] Page load times
- [ ] Error rates
- [ ] Database query performance

## Launch Checklist

Before announcing to users:

- [ ] All core features tested and working
- [ ] Error tracking configured
- [ ] Backups configured
- [ ] HTTPS/SSL enabled
- [ ] Privacy policy page created (if needed)
- [ ] Terms of service created (if needed)
- [ ] Contact/support email set up
- [ ] Social media accounts created (optional)
- [ ] Analytics set up (Google Analytics, Plausible, etc.)

---

**Remember:** Start small, monitor closely, and iterate based on real user feedback. You can always scale up as the community grows! 🌱

Good luck with your launch! 🚀
