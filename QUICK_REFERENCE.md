# Early Bloom - Quick Reference Card 📋

## 🚀 Quick Start Commands

```bash
# First time setup
bundle install && yarn install
bin/rails db:create db:migrate db:seed

# Start development server
bin/dev

# Access application
open http://localhost:3000
```

## 🔐 Test Credentials

```
Email: test@example.com
Password: password123
```

## 📂 Key Files

| Purpose | Location |
|---------|----------|
| Routes | `config/routes.rb` |
| Controllers | `app/controllers/` |
| Models | `app/models/` |
| Views | `app/views/` |
| Services | `app/services/` |
| Migrations | `db/migrate/` |
| Seeds | `db/seeds.rb` |
| Tailwind CSS | `app/assets/stylesheets/application.tailwind.css` |
| JavaScript | `app/javascript/application.js` |

## 🎨 Core Models

```ruby
User
  ├── has_many :child_profiles
  ├── has_many :posts
  ├── has_many :comments
  └── has_many :reactions

ChildProfile
  ├── belongs_to :user
  ├── has_many :posts
  ├── age_in_months (method)
  └── age_in_days (method)

Post
  ├── belongs_to :user
  ├── belongs_to :child_profile
  ├── has_many :comments
  ├── has_many :reactions
  └── Types: question, experience, milestone, advice

Comment
  ├── belongs_to :user
  └── belongs_to :post

Reaction
  ├── belongs_to :user
  ├── belongs_to :post
  └── Types: helpful, reassuring, relatable, celebrate
```

## 🛣️ Main Routes

```
GET  /                    # Home page
GET  /login               # Login form
POST /login               # Login action
GET  /signup              # Signup form
POST /signup              # Create account
GET  /feed                # Age-aware feed (requires login)
GET  /posts               # All posts
GET  /posts/:id           # View post
GET  /posts/new           # New post form
POST /posts               # Create post
POST /posts/:id/comments  # Add comment
POST /posts/:id/reactions # Add reaction
```

## 💻 Common Commands

### Database
```bash
bin/rails db:migrate          # Run migrations
bin/rails db:rollback         # Undo last migration
bin/rails db:reset            # Drop, create, migrate, seed
bin/rails db:seed             # Load seed data
```

### Development
```bash
bin/rails console             # Rails console
bin/rails routes              # Show all routes
bin/rails server              # Start server (or use bin/dev)
bin/rails test                # Run tests
```

### Assets
```bash
yarn build                    # Build JavaScript
yarn build:css                # Build Tailwind CSS
```

## 🎯 Key Features

✅ User authentication (bcrypt)  
✅ Child profile management  
✅ Age-aware feed (±3 months)  
✅ 4 post types (question, experience, milestone, advice)  
✅ Comments & reactions  
✅ Responsive design (Tailwind CSS)  
✅ Turbo & Stimulus ready  
✅ Service objects (FeedBuilder)  
✅ Comprehensive seed data  

## 🔍 Troubleshooting

### Port already in use
```bash
lsof -ti:3000 | xargs kill -9
```

### Assets not compiling
```bash
yarn install
bin/dev
```

### Database errors
```bash
bin/rails db:drop db:create db:migrate db:seed
```

### Clear cache
```bash
bin/rails tmp:clear
```

## 📊 Sample Data Stats

- 5 Users (Sarah, Michael, Emily, David, Test User)
- 6 Child Profiles (ages 2-6 months)
- 6 Community Posts
- 7 Supportive Comments
- 17 Reactions

All passwords: `password123`

## 🎨 Color Palette

```css
/* Primary */
emerald-600: #059669   /* Buttons, links */
emerald-700: #047857   /* Hover states */

/* Neutral */
stone-50: #fafaf9      /* Background */
stone-200: #e7e5e4     /* Borders */
stone-600: #57534e     /* Text */
stone-800: #292524     /* Headings */
```

## 📝 Post Types & Reactions

### Post Types
- 💬 Question - Seeking help
- 📖 Experience - Sharing stories
- 🎉 Milestone - Celebrating achievements
- 💡 Advice - Sharing wisdom

### Reaction Types
- 💡 Helpful - Found this useful
- 💚 Reassuring - This comforted me
- 🤝 Relatable - I've been there too
- 🎉 Celebrate - Happy for you!

## 🚀 Next Steps

1. **Test locally** - Try all features
2. **Read docs** - Check README.md and GETTING_STARTED.md
3. **Add features** - Pick from roadmap in PROJECT_SUMMARY.md
4. **Deploy** - Follow DEPLOYMENT.md checklist
5. **Add AI** - Explore AI_INTEGRATION.md

## 📚 Documentation Files

- `README.md` - Project overview & philosophy
- `GETTING_STARTED.md` - Setup guide & troubleshooting
- `PROJECT_SUMMARY.md` - Complete feature list
- `AI_INTEGRATION.md` - AI features roadmap
- `DEPLOYMENT.md` - Production deployment checklist
- `QUICK_REFERENCE.md` - This file

## 💡 Pro Tips

1. Always use `bin/dev` (not `bin/rails server`) - compiles assets
2. Use `FeedBuilder.new(child_profile).posts` for age-aware queries
3. Test with multiple users to see feed filtering
4. Check `db/seeds.rb` for realistic test data examples
5. All views use Tailwind - no custom CSS needed

## 🐛 Common Gotchas

- Remember to restart server after Gemfile changes
- Turbo requires data attributes for form submissions
- Age calculation uses PostgreSQL's AGE function
- Reactions are unique per user per post
- Feed requires logged-in user with child profile

## 📞 Getting Help

- Check Rails Guides: https://guides.rubyonrails.org
- Tailwind Docs: https://tailwindcss.com/docs
- Turbo Handbook: https://turbo.hotwired.dev
- Stimulus Handbook: https://stimulus.hotwired.dev

---

**Built with 💚 for new parents everywhere** 🌸

Happy coding! Remember: You're building something meaningful.
