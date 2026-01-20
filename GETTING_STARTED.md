# Getting Started with Early Bloom 🌸

Welcome! This guide will help you get Early Bloom up and running on your local machine.

## Prerequisites

Make sure you have the following installed:

- **Ruby 3.4+** - Check with `ruby -v`
- **PostgreSQL** - Check with `psql --version`
- **Node.js & Yarn** - Check with `node -v` and `yarn -v`
- **Bundler** - Install with `gem install bundler`

## Quick Start

### 1. Clone and Setup

```bash
cd /Users/kshitiz/Dev/early_bloom

# Install Ruby dependencies
bundle install

# Install JavaScript dependencies
yarn install
```

### 2. Setup Database

```bash
# Create databases
bin/rails db:create

# Run migrations
bin/rails db:migrate

# Load sample data (optional but recommended for testing)
bin/rails db:seed
```

### 3. Start the Application

```bash
# Start all services (web server, JS bundler, CSS compiler)
bin/dev
```

The application will be available at **http://localhost:3000**

## Login Credentials

After running `bin/rails db:seed`, you can login with:

**Test Account:**
- Email: `test@example.com`
- Password: `password123`

**Other Sample Accounts:**
- `sarah@example.com` / `password123`
- `michael@example.com` / `password123`
- `emily@example.com` / `password123`
- `david@example.com` / `password123`

## Exploring the Application

### As a New User

1. Visit http://localhost:3000
2. Click "Sign Up"
3. Fill in your details
4. Create a child profile (name + birth date)
5. Start browsing the age-aware feed!

### Sample Data Includes

- 5 users with diverse backgrounds
- 6 child profiles at different ages (2-6 months old)
- 6 community posts (questions, experiences, milestones, advice)
- 7 supportive comments
- Multiple reactions showing community support

## Application Features to Test

### 1. Age-Aware Feed
- Login as `test@example.com`
- The feed shows posts from children within ±3 months of your child's age
- Try different accounts to see how the feed changes based on child age

### 2. Creating Posts
- Click "New Post" in the navigation
- Choose post type: Question, Experience, Milestone, or Advice
- Share your story with the community

### 3. Engaging with Posts
- Click on any post to read full details
- Add supportive reactions (💡 Helpful, 💚 Reassuring, 🤝 Relatable, 🎉 Celebrate)
- Leave encouraging comments
- Only the post author can edit/delete their own posts

### 4. User Flow
1. **Signup** → Create account
2. **Child Profile** → Add child details (redirected automatically)
3. **Feed** → See age-appropriate content
4. **Post** → Share your experience
5. **Engage** → React and comment on others' posts

## Development Commands

```bash
# Rails console
bin/rails console

# Run tests
bin/rails test

# Database operations
bin/rails db:migrate          # Run pending migrations
bin/rails db:rollback         # Rollback last migration
bin/rails db:reset            # Drop, create, migrate, seed
bin/rails db:seed             # Load seed data

# Clear and reseed database
bin/rails db:reset

# Check routes
bin/rails routes

# Code style/security checks
bundle exec brakeman          # Security analysis
```

## Project Structure

```
app/
├── controllers/              # Request handlers
│   ├── sessions_controller.rb      # Login/logout
│   ├── registrations_controller.rb # Signup
│   ├── posts_controller.rb         # Posts & feed
│   ├── comments_controller.rb      # Comments
│   ├── reactions_controller.rb     # Reactions
│   └── child_profiles_controller.rb # Child management
├── models/                   # Domain logic
│   ├── user.rb              # Parent accounts
│   ├── child_profile.rb     # Child info (age calculation)
│   ├── post.rb              # Community posts
│   ├── comment.rb           # Responses
│   └── reaction.rb          # Emotional support
├── services/                # Business logic
│   └── feed_builder.rb      # Age-aware feed algorithm
└── views/                   # HTML templates
    ├── layouts/
    ├── home/
    ├── posts/
    └── ...
```

## Common Issues & Solutions

### Port Already in Use

If you see `Address already in use - bind(2) for "127.0.0.1" port 3000`:

```bash
# Kill the process using port 3000
lsof -ti:3000 | xargs kill -9

# Or use a different port
bin/rails server -p 3001
```

### Database Connection Error

Make sure PostgreSQL is running:

```bash
# macOS
brew services start postgresql

# Linux
sudo service postgresql start
```

### Asset Compilation Issues

```bash
# Rebuild JavaScript
yarn build

# Rebuild CSS
yarn build:css

# Or restart bin/dev to auto-rebuild
```

## Next Steps

### Extend the Application

1. **Add Search** - Find posts by keywords
2. **User Profiles** - View other parents' profiles
3. **Private Groups** - Create location-based or interest-based groups
4. **Notifications** - Email or in-app alerts for new comments
5. **AI Features** - Gentle moderation, suggested topics, empathetic responses

### Best Practices

- Always run migrations after pulling changes: `bin/rails db:migrate`
- Keep seed data updated for realistic testing
- Use service objects for complex business logic
- Follow RESTful conventions for new controllers
- Keep views simple, move logic to helpers/models

## Support & Resources

- **Rails Guides:** https://guides.rubyonrails.org/
- **Turbo Handbook:** https://turbo.hotwired.dev/
- **Stimulus Handbook:** https://stimulus.hotwired.dev/
- **Tailwind CSS:** https://tailwindcss.com/docs

---

Happy coding! Remember: You're building something meaningful for new parents everywhere. 💚
