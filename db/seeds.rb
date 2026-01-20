# Clear existing data in development
if Rails.env.development?
  puts "Clearing existing data..."
  Reaction.destroy_all
  Comment.destroy_all
  Post.destroy_all
  ChildProfile.destroy_all
  User.destroy_all
  Category.destroy_all
end

# Create categories
puts "Creating categories..."

categories_data = [
  { name: "Sleep", description: "Sleep schedules, sleep training, naps, and nighttime routines", icon: "😴", color: "indigo" },
  { name: "Feeding", description: "Breastfeeding, formula, bottle feeding, and starting solids", icon: "🍼", color: "amber" },
  { name: "Health", description: "Illness, vaccinations, doctor visits, and general wellness", icon: "🏥", color: "red" },
  { name: "Development", description: "Milestones, growth, tummy time, and learning", icon: "🌱", color: "emerald" },
  { name: "Gear & Products", description: "Strollers, car seats, baby products, and recommendations", icon: "🛒", color: "blue" },
  { name: "Self Care", description: "Parent mental health, rest, and taking care of yourself", icon: "💚", color: "pink" },
  { name: "Relationships", description: "Partner dynamics, family, and support systems", icon: "👨‍👩‍👧", color: "purple" },
  { name: "General", description: "Everything else - questions, stories, and community chat", icon: "💬", color: "stone" }
]

categories = categories_data.map { |attrs| Category.create!(attrs) }
puts "Created #{categories.count} categories"

puts "Creating sample users..."

# Create sample users
users = [
  {
    name: "Sarah Johnson",
    email: "sarah@example.com",
    password: "password123",
    bio: "First-time mom navigating the beautiful chaos of parenthood"
  },
  {
    name: "Michael Chen",
    email: "michael@example.com",
    password: "password123",
    bio: "Dad of twins, learning as I go"
  },
  {
    name: "Emily Rodriguez",
    email: "emily@example.com",
    password: "password123",
    bio: "Mom to a beautiful baby girl, grateful for this community"
  },
  {
    name: "David Kim",
    email: "david@example.com",
    password: "password123",
    bio: "Stay-at-home dad, loving every moment"
  },
  {
    name: "Test User",
    email: "test@example.com",
    password: "password123",
    bio: "Test account for trying out features"
  }
]

created_users = users.map { |attrs| User.create!(attrs) }
puts "Created #{created_users.count} users"

# Create child profiles with varying ages
puts "Creating child profiles..."

child_data = [
  { user: created_users[0], name: "Emma", months_ago: 2 },
  { user: created_users[1], name: "Oliver", months_ago: 3 },
  { user: created_users[1], name: "Olivia", months_ago: 3 },  # Twin
  { user: created_users[2], name: "Sophia", months_ago: 4 },
  { user: created_users[3], name: "Noah", months_ago: 6 },
  { user: created_users[4], name: "Baby", months_ago: 2 }
]

child_profiles = child_data.map do |data|
  data[:user].child_profiles.create!(
    name: data[:name],
    birth_date: data[:months_ago].months.ago.to_date
  )
end

puts "Created #{child_profiles.count} child profiles"

# Create sample posts
puts "Creating sample posts..."

sleep_cat = Category.find_by(name: "Sleep")
health_cat = Category.find_by(name: "Health")
development_cat = Category.find_by(name: "Development")
self_care_cat = Category.find_by(name: "Self Care")

posts_data = [
  {
    user: created_users[0],
    child_profile: child_profiles[0],
    category: sleep_cat,
    post_type: "question",
    title: "Sleep regression at 2 months?",
    body: "Emma was sleeping pretty well, but this week she's been waking up every hour. Is this normal at 2 months? I'm so exhausted but trying to stay patient. Any advice or experiences to share?"
  },
  {
    user: created_users[1],
    child_profile: child_profiles[1],
    category: sleep_cat,
    post_type: "experience",
    title: "Twins sleeping through the night!",
    body: "After months of tag-team feeding, both Oliver and Olivia slept for 6 hours straight last night! I actually woke up panicked because it was so quiet. Just wanted to share this win with all of you who understand the struggle. It gets better!"
  },
  {
    user: created_users[2],
    child_profile: child_profiles[3],
    category: development_cat,
    post_type: "milestone",
    title: "First smile! 😊",
    body: "Sophia gave me her first real smile today (not gas this time, I swear!). I literally cried. These little moments make everything worth it. To all the tired parents out there - hang in there, these moments are coming for you too!"
  },
  {
    user: created_users[3],
    child_profile: child_profiles[4],
    category: development_cat,
    post_type: "advice",
    title: "Tummy time tips that worked for us",
    body: "Noah hated tummy time at first. What helped: 1) Getting down on his level 2) Putting him on my chest instead of the floor 3) Keeping sessions short (2-3 minutes) 4) Singing to him. Now he actually enjoys it! Hope this helps someone."
  },
  {
    user: created_users[0],
    child_profile: child_profiles[0],
    category: health_cat,
    post_type: "question",
    title: "Diaper rash won't go away",
    body: "Emma has had a diaper rash for 3 days now. I've been using diaper cream at every change and letting her have some diaper-free time. Still not improving. Should I be worried? What worked for your babies?"
  },
  {
    user: created_users[2],
    child_profile: child_profiles[3],
    category: self_care_cat,
    post_type: "experience",
    title: "Finally accepting help",
    body: "I've been trying to do everything myself because I felt like I should be able to handle it. Today I finally accepted my mom's offer to come over and help. She held Sophia while I showered and napped. Game changer. Don't be like me - accept the help! 💚"
  }
]

posts = posts_data.map do |data|
  post = data[:user].posts.create!(
    child_profile: data[:child_profile],
    category: data[:category],
    post_type: data[:post_type],
    title: data[:title],
    body: data[:body],
    published_at: rand(1..7).days.ago
  )
  post
end

puts "Created #{posts.count} posts"

# Create some comments
puts "Creating comments..."

comments_data = [
  { post: posts[0], user: created_users[1], body: "We went through this too! It's totally normal. Their sleep patterns change a lot in the first few months. Hang in there!" },
  { post: posts[0], user: created_users[2], body: "The 2 month sleep regression is real. It usually lasts a week or two. You're doing great! ❤️" },
  { post: posts[1], user: created_users[0], body: "Congratulations! This gives me hope! 🎉" },
  { post: posts[2], user: created_users[3], body: "That's amazing! Those first smiles are pure magic." },
  { post: posts[3], user: created_users[0], body: "Thank you for sharing this! Going to try the chest method with Emma." },
  { post: posts[4], user: created_users[3], body: "Try using plain coconut oil! It worked wonders for Noah's rashes. But if it's not better in another day or two, definitely call the pediatrician." },
  { post: posts[5], user: created_users[1], body: "Yes! Accepting help was the hardest lesson for me too. We can't do it all alone, and that's okay." }
]

comments = comments_data.map { |data| data[:post].comments.create!(user: data[:user], body: data[:body]) }

puts "Created #{comments.count} comments"

# Create reactions
puts "Creating reactions..."

reaction_types = ['helpful', 'reassuring', 'relatable', 'celebrate']

posts.each do |post|
  # Each post gets 2-5 random reactions from different users
  rand(2..5).times do
    user = created_users.sample
    reaction_type = reaction_types.sample
    
    begin
      post.reactions.create!(
        user: user,
        reaction_type: reaction_type
      )
    rescue ActiveRecord::RecordInvalid
      # Skip if duplicate (same user already reacted to this post)
      next
    end
  end
end

puts "Created reactions for all posts"

puts "\n✅ Seed data created successfully!"
puts "\nYou can now log in with:"
puts "  Email: test@example.com"
puts "  Password: password123"
puts "\nOr try any of the other sample users (sarah@example.com, michael@example.com, etc.)"
