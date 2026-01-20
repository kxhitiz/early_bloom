# Early Bloom 🌸

**A community-first application designed for new parents**

Early Bloom provides a calm, safe space to share experiences, ask questions, and find reassurance during the earliest stages of a child's growth. The app centers around age-aware community discussions, ensuring parents see content that is relevant to their child's current stage, and emphasizes empathy over judgment.

## Vision

Rather than overwhelming users with conflicting or fear-driven advice, Early Bloom highlights real experiences from other parents and offers gentle, non-medical guidance to help parents feel confident, supported, and less alone.

## Technical Stack

- **Framework:** Ruby on Rails 8.0
- **Database:** PostgreSQL
- **Frontend:** Turbo, StimulusJS, Tailwind CSS
- **JavaScript Bundling:** esbuild
- **CSS Processing:** Tailwind CLI
- **Authentication:** bcrypt (has_secure_password)
- **Pagination:** Kaminari

## Core Features

### 1. Age-Aware Feed
Posts are filtered based on your child's age, showing content from parents with children within ±3 months of your child's age. This ensures relevance and reduces information overload.

### 2. Post Types
- **Question** - Seeking help from the community
- **Experience** - Sharing what happened
- **Milestone** - Celebrating achievements
- **Advice** - Sharing what worked for you

### 3. Supportive Reactions
Instead of simple likes, reactions include:
- 💡 Helpful
- 💚 Reassuring
- 🤝 Relatable
- 🎉 Celebrate

### 4. Privacy-First
- Secure authentication
- Child profiles use names/nicknames (no full names required)
- Community-focused without public profiles

## Architecture

### Domain Models

- **User** - Parent accounts with secure authentication
- **ChildProfile** - Child information (name, birth date) for age calculation
- **Post** - Community posts with type classification
- **Comment** - Responses to posts
- **Reaction** - Emotional responses to posts

### Service Objects

- **FeedBuilder** - Handles age-aware feed logic, keeping controllers thin

### Key Design Decisions

1. **Server-Rendered Views** - Fast, simple, accessible
2. **Turbo & Stimulus** - Progressive enhancement without heavy client-side JS
3. **Service Objects** - Domain logic separated from controllers
4. **Minimal JavaScript** - Only where interactivity adds value
5. **Tailwind CSS** - Utility-first, calming color palette (emerald/stone)

## Getting Started

### Prerequisites

- Ruby 3.4+
- PostgreSQL
- Node.js & Yarn (for asset compilation)

### Setup

```bash
# Clone the repository
git clone <repository-url>
cd early_bloom

# Install dependencies
bundle install
yarn install

# Setup database
bin/rails db:create
bin/rails db:migrate

# Start the development server
bin/dev
```

The app will be available at `http://localhost:3000`

### Development

```bash
# Run the server with auto-reloading assets
bin/dev

# Run tests
bin/rails test

# Open Rails console
bin/rails console

# Database operations
bin/rails db:migrate
bin/rails db:rollback
bin/rails db:seed
```

## Project Structure

```
app/
├── controllers/         # Request handling
│   ├── application_controller.rb
│   ├── sessions_controller.rb
│   ├── registrations_controller.rb
│   ├── posts_controller.rb
│   ├── comments_controller.rb
│   ├── reactions_controller.rb
│   └── child_profiles_controller.rb
├── models/             # Domain models
│   ├── user.rb
│   ├── child_profile.rb
│   ├── post.rb
│   ├── comment.rb
│   └── reaction.rb
├── services/          # Business logic
│   └── feed_builder.rb
├── views/             # ERB templates
│   ├── layouts/
│   ├── home/
│   ├── sessions/
│   ├── registrations/
│   ├── posts/
│   └── child_profiles/
└── helpers/           # View helpers
    └── posts_helper.rb
```

## Future Enhancements

### MVP+
- [ ] Search functionality
- [ ] User profiles with bio
- [ ] Direct messaging between parents
- [ ] Notifications (email/in-app)
- [ ] Tags for posts
- [ ] Bookmarking posts

### AI Capabilities
- [ ] Gentle content moderation
- [ ] Suggested topics based on child age
- [ ] Smart summaries of long discussions
- [ ] Empathetic auto-responses to common questions
- [ ] Pattern recognition for developmental milestones

### Community Features
- [ ] Private groups by location or interest
- [ ] Expert Q&A sessions
- [ ] Resource library (articles, guides)
- [ ] Anonymous posting option
- [ ] Report/flag inappropriate content

## Philosophy

Early Bloom is built on these principles:

1. **Empathy Over Judgment** - Every parent's journey is unique
2. **Relevance Over Volume** - Quality, timely content beats information overload
3. **Community Over Competition** - Support, not comparison
4. **Privacy First** - Safe spaces require trust
5. **Simplicity** - Clean, calm design that doesn't overwhelm

## Contributing

This is a passion project aimed at supporting new parents. Contributions should align with the core philosophy of empathy, support, and simplicity.

## License

[Specify your license here]

---

Built with 💚 for new parents everywhere.
