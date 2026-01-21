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
users_data = [
  { name: "Sarah Johnson", email: "sarah@example.com", password: "password123", bio: "First-time mom navigating the beautiful chaos of parenthood" },
  { name: "Michael Chen", email: "michael@example.com", password: "password123", bio: "Dad of twins, learning as I go" },
  { name: "Emily Rodriguez", email: "emily@example.com", password: "password123", bio: "Mom to a beautiful baby girl, grateful for this community" },
  { name: "David Kim", email: "david@example.com", password: "password123", bio: "Stay-at-home dad, loving every moment" },
  { name: "Jessica Taylor", email: "jessica@example.com", password: "password123", bio: "Second-time mom, still learning new things every day" },
  { name: "Ryan Patel", email: "ryan@example.com", password: "password123", bio: "New dad figuring it out one diaper at a time" },
  { name: "Amanda Wilson", email: "amanda@example.com", password: "password123", bio: "Pediatric nurse and new mom - yes, it's still hard!" },
  { name: "Chris Martinez", email: "chris@example.com", password: "password123", bio: "Working dad trying to be present for every moment" },
  { name: "Lauren Thompson", email: "lauren@example.com", password: "password123", bio: "Mom of two under two. Send coffee." },
  { name: "James O'Brien", email: "james@example.com", password: "password123", bio: "First-time dad, endlessly amazed by this tiny human" },
  { name: "Test User", email: "test@example.com", password: "password123", bio: "Test account for trying out features" },
  { name: "Kshitiz Gurung", email: "nirvanagrg@gmail.com", password: "password123", bio: "Professional football player" },
]

created_users = users_data.map { |attrs| User.create!(attrs) }
puts "Created #{created_users.count} users"

# Create child profiles with varying ages
puts "Creating child profiles..."

child_data = [
  { user: created_users[0], name: "Emma", months_ago: 2 },
  { user: created_users[1], name: "Oliver", months_ago: 3 },
  { user: created_users[1], name: "Olivia", months_ago: 3 },
  { user: created_users[2], name: "Sophia", months_ago: 4 },
  { user: created_users[3], name: "Noah", months_ago: 6 },
  { user: created_users[4], name: "Lily", months_ago: 8 },
  { user: created_users[4], name: "Jack", months_ago: 24 },
  { user: created_users[5], name: "Ethan", months_ago: 1 },
  { user: created_users[6], name: "Ava", months_ago: 5 },
  { user: created_users[7], name: "Mason", months_ago: 7 },
  { user: created_users[8], name: "Harper", months_ago: 3 },
  { user: created_users[8], name: "Lucas", months_ago: 18 },
  { user: created_users[9], name: "Mia", months_ago: 2 },
  { user: created_users[10], name: "Baby", months_ago: 3 }
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
feeding_cat = Category.find_by(name: "Feeding")
health_cat = Category.find_by(name: "Health")
development_cat = Category.find_by(name: "Development")
gear_cat = Category.find_by(name: "Gear & Products")
self_care_cat = Category.find_by(name: "Self Care")
relationships_cat = Category.find_by(name: "Relationships")
general_cat = Category.find_by(name: "General")

posts_data = [
  # Sleep posts
  {
    user: created_users[0], child_profile: child_profiles[0], category: sleep_cat, post_type: "question",
    title: "Sleep regression at 2 months?",
    body: "Emma was sleeping pretty well, but this week she's been waking up every hour. Is this normal at 2 months? I'm so exhausted but trying to stay patient. Any advice or experiences to share?",
    ai_answer: "Sleep disruptions around 2 months are very common and often called the '2-month sleep regression.' At this age, babies are becoming more aware of their surroundings and their sleep cycles are maturing. This phase typically lasts 1-2 weeks. Some things that may help: establish a consistent bedtime routine, ensure the room is dark and at a comfortable temperature (68-72°F), try white noise, and watch for sleepy cues to avoid overtiredness. Remember, this is temporary and you're doing a great job! If sleep issues persist beyond 2-3 weeks, consult your pediatrician."
  },
  {
    user: created_users[1], child_profile: child_profiles[1], category: sleep_cat, post_type: "experience",
    title: "Twins sleeping through the night!",
    body: "After months of tag-team feeding, both Oliver and Olivia slept for 6 hours straight last night! I actually woke up panicked because it was so quiet. Just wanted to share this win with all of you who understand the struggle. It gets better!"
  },
  {
    user: created_users[5], child_profile: child_profiles[7], category: sleep_cat, post_type: "question",
    title: "Newborn won't sleep unless held",
    body: "Ethan is 4 weeks old and will only sleep if someone is holding him. The moment we put him down, he wakes up crying. We've tried warming the bassinet, swaddling tight, white noise... nothing works. Any suggestions? We're running on fumes here.",
    ai_answer: "This is incredibly common at 4 weeks - your baby spent 9 months being held constantly in the womb! Some strategies that may help: try the '5 S's' (swaddle, side/stomach position while holding, shush, swing, suck), wait until baby is in deep sleep (limp limbs, slow breathing) before transferring, keep your hand on their chest for a few minutes after laying down, try a warming pad to pre-warm the sleep surface (remove before placing baby), or consider safe co-sleeping alternatives like a bedside bassinet. Contact naps are also perfectly fine and won't create bad habits at this age. This phase does pass - hang in there!"
  },
  {
    user: created_users[7], child_profile: child_profiles[9], category: sleep_cat, post_type: "advice",
    title: "The 'wake windows' approach changed everything",
    body: "I was so confused about Mason's sleep until I learned about wake windows. At 7 months, he can only stay awake about 2.5-3 hours before getting overtired. Once I started watching for sleepy cues and timing his naps, everything improved. Google 'wake windows by age' if you haven't already!"
  },

  # Feeding posts
  {
    user: created_users[6], child_profile: child_profiles[8], category: feeding_cat, post_type: "question",
    title: "Combination feeding - am I doing it wrong?",
    body: "Ava is 5 months and I've been combo feeding (breast + formula) since month 2 due to supply issues. She's gaining weight well but I keep getting comments about 'nipple confusion' and 'giving up too easily.' Is combo feeding really that bad? It's working for us but the guilt is real.",
    ai_answer: "Combination feeding is absolutely a valid choice and you're doing great! Research shows that 'nipple confusion' is largely a myth - most babies can switch between breast and bottle without issues. What matters most is that your baby is fed, growing well, and thriving - which it sounds like Ava is! Combo feeding offers flexibility and can actually help extend your breastfeeding journey by reducing pressure and burnout. Every family's feeding journey is unique. Trust yourself and ignore the unsolicited opinions. You know what's best for your baby and your family."
  },
  {
    user: created_users[4], child_profile: child_profiles[5], category: feeding_cat, post_type: "experience",
    title: "Starting solids - the mess is REAL",
    body: "Just started Lily on purées this week. I was not prepared for how much sweet potato would end up in her hair, on the walls, on ME. But her little face when she tasted banana for the first time? Worth every bit of cleanup. 😂"
  },
  {
    user: created_users[8], child_profile: child_profiles[10], category: feeding_cat, post_type: "question",
    title: "Refusing the bottle suddenly",
    body: "Harper has been taking bottles fine for weeks, but suddenly she screams whenever we try. She's 3 months and I need to go back to work soon. Has anyone dealt with a bottle strike? What worked?",
    ai_answer: "Bottle strikes are frustrating but common around 3 months. Here are some strategies: try different bottle brands/nipple shapes (some babies become particular), have someone other than mom offer the bottle while mom is out of the house, try different feeding positions (some babies prefer upright or even facing outward), offer the bottle when baby is drowsy but not fully asleep or starving, try different milk temperatures, and pace the feeding to mimic breastfeeding. Most babies will eventually take a bottle when hungry enough, especially once mom returns to work. It may take patience and experimentation!"
  },
  {
    user: created_users[9], child_profile: child_profiles[12], category: feeding_cat, post_type: "milestone",
    title: "She held her own bottle!",
    body: "Mia grabbed her bottle and held it herself for the first time today! It only lasted about 30 seconds before she dropped it on her face, but still - my little girl is growing up! 🥹"
  },

  # Health posts
  {
    user: created_users[0], child_profile: child_profiles[0], category: health_cat, post_type: "question",
    title: "Diaper rash won't go away",
    body: "Emma has had a diaper rash for 3 days now. I've been using diaper cream at every change and letting her have some diaper-free time. Still not improving. Should I be worried? What worked for your babies?",
    ai_answer: "Persistent diaper rash after 3 days of treatment may need a different approach. If the rash is bright red with defined edges or has small red dots around the edges, it could be a yeast infection which requires antifungal cream (like Lotrimin). Other tips: change diapers more frequently, use fragrance-free wipes or just water and a soft cloth, try a different diaper brand, apply a thick layer of barrier cream (zinc oxide works well), and ensure the area is completely dry before putting on a new diaper. If it doesn't improve in another 2-3 days or gets worse, definitely contact your pediatrician as prescription treatment may be needed."
  },
  {
    user: created_users[5], child_profile: child_profiles[7], category: health_cat, post_type: "question",
    title: "First vaccines tomorrow - what to expect?",
    body: "Ethan has his 2-month vaccines tomorrow and I'm nervous. What should I expect? How fussy do they usually get? Should I give Tylenol before or after? Any tips from parents who've been through it?",
    ai_answer: "It's normal to feel nervous! Here's what to expect: babies typically cry during the shots but calm down quickly with comfort. Afterward, some fussiness, sleepiness, and mild fever (up to 101°F) are common for 1-2 days. The AAP now recommends giving Tylenol AFTER vaccines if needed for discomfort, not before. Have infant Tylenol ready at home and check dosing with your pediatrician. Comfort measures: extra cuddles, breastfeeding/bottle right after, cool compress on injection site if needed. Call your doctor if fever exceeds 101°F, baby is inconsolable for hours, or you notice unusual symptoms. You've got this!"
  },
  {
    user: created_users[6], child_profile: child_profiles[8], category: health_cat, post_type: "experience",
    title: "Trust your instincts - our ER visit",
    body: "Ava had a fever that everyone said was 'just teething.' Something felt off to me so I took her in anyway. Turns out she had a UTI that needed antibiotics. I'm so glad I listened to my gut. If something feels wrong, get it checked. You know your baby best."
  },
  {
    user: created_users[3], child_profile: child_profiles[4], category: health_cat, post_type: "advice",
    title: "Saline drops + nose frida = lifesaver",
    body: "Noah's first cold was terrifying. He couldn't breathe well and wouldn't eat. The combo of saline drops followed by the NoseFrida made SUCH a difference. Gross? Yes. Effective? Absolutely. Stock up before cold season!"
  },

  # Development posts
  {
    user: created_users[2], child_profile: child_profiles[3], category: development_cat, post_type: "milestone",
    title: "First smile! 😊",
    body: "Sophia gave me her first real smile today (not gas this time, I swear!). I literally cried. These little moments make everything worth it. To all the tired parents out there - hang in there, these moments are coming for you too!"
  },
  {
    user: created_users[3], child_profile: child_profiles[4], category: development_cat, post_type: "advice",
    title: "Tummy time tips that worked for us",
    body: "Noah hated tummy time at first. What helped: 1) Getting down on his level 2) Putting him on my chest instead of the floor 3) Keeping sessions short (2-3 minutes) 4) Singing to him. Now he actually enjoys it! Hope this helps someone."
  },
  {
    user: created_users[7], child_profile: child_profiles[9], category: development_cat, post_type: "milestone",
    title: "He said 'mama'!!! (I think?)",
    body: "Mason has been babbling 'mamamamama' all day. My husband says it doesn't count as his first word since he's not directing it at me, but I'M COUNTING IT. 😂 When did your babies start with intentional words?"
  },
  {
    user: created_users[4], child_profile: child_profiles[5], category: development_cat, post_type: "question",
    title: "Not crawling at 8 months - worried",
    body: "Lily is 8 months and shows zero interest in crawling. She's happy to sit and play but won't get on all fours. Pediatrician says she's fine but I see other babies her age zooming around. Should I be concerned or doing more to encourage her?",
    ai_answer: "If your pediatrician isn't concerned, try not to worry! The typical range for crawling is 6-10 months, and some babies skip crawling entirely and go straight to walking. Every baby develops at their own pace. To encourage movement: place toys just out of reach, do lots of tummy time, get down on the floor with her, and create a safe space for exploration. Some babies are 'observers' who prefer to watch and learn before trying. As long as she's meeting other milestones (sitting, reaching, engaging), she's likely just taking her own time. Keep enjoying her current stage!"
  },

  # Gear posts
  {
    user: created_users[1], child_profile: child_profiles[1], category: gear_cat, post_type: "question",
    title: "Double stroller recommendations?",
    body: "Now that the twins are getting bigger, I need a double stroller. Looking at the Uppababy Vista v2 with rumble seat vs the Baby Jogger City Select. Anyone have experience with either? Priorities are: easy to fold, fits through doorways, decent storage.",
    ai_answer: "Both are excellent choices! The UppaBaby Vista V2 has a sleeker design and better resale value, but the rumble seat sits lower and is weight-limited to 35 lbs. The Baby Jogger City Select offers more equal seating positions and handles heavier kids. For doorways, both are around 25.5\" wide (standard doors are 32\"). The City Select has a slightly easier fold. Consider: if your twins are similar ages, City Select's side-by-side seating might work better; if different ages, the Vista's inline design could be more practical. Test both in-store if possible - the 'feel' while pushing matters a lot!"
  },
  {
    user: created_users[9], child_profile: child_profiles[12], category: gear_cat, post_type: "advice",
    title: "Skip the expensive baby monitor",
    body: "We spent $300 on a fancy video monitor and honestly? A $40 audio-only monitor would have been fine. Baby is in the next room and we can hear her just fine. Save your money for the things that actually matter (like coffee)."
  },
  {
    user: created_users[8], child_profile: child_profiles[10], category: gear_cat, post_type: "question",
    title: "Best carrier for a bad back?",
    body: "I have chronic back pain and need a carrier that's supportive. Harper is about 12 lbs now. Tried a cheap one and my back was screaming. Is the Ergobaby or Baby Bjorn worth the price? Open to other suggestions too!",
    ai_answer: "For back pain, proper support is essential and worth the investment. Top recommendations: Ergobaby Omni 360 or Omni Breeze (excellent lumbar support), Lillebaby Complete (great back support with extra lumbar padding), or Tula Free-to-Grow. Key features to look for: wide waistband that sits on hips (not waist), padded shoulder straps, lumbar support panel, and the ability to position baby high and close to your body. Baby Bjorn is lighter but offers less back support. Also consider: wearing baby on your back once they have good head control distributes weight better. Try before you buy if possible!"
  },

  # Self Care posts
  {
    user: created_users[2], child_profile: child_profiles[3], category: self_care_cat, post_type: "experience",
    title: "Finally accepting help",
    body: "I've been trying to do everything myself because I felt like I should be able to handle it. Today I finally accepted my mom's offer to come over and help. She held Sophia while I showered and napped. Game changer. Don't be like me - accept the help! 💚"
  },
  {
    user: created_users[8], child_profile: child_profiles[10], category: self_care_cat, post_type: "experience",
    title: "Therapy is helping me be a better mom",
    body: "I started seeing a therapist for postpartum anxiety and it's been transformative. I was so anxious I couldn't sleep even when Harper slept. Learning coping strategies has made me more present and patient. No shame in getting help. 💚"
  },
  {
    user: created_users[0], child_profile: child_profiles[0], category: self_care_cat, post_type: "question",
    title: "When does it get easier?",
    body: "I'm 2 months in and still feel like I'm drowning. Everyone says 'it gets easier' but when? I love Emma more than anything but I miss feeling like myself. I miss sleeping. I miss having a conversation that isn't about diapers. Please tell me there's a light at the end of this tunnel.",
    ai_answer: "What you're feeling is so valid and incredibly common. The first 3 months are often called the 'fourth trimester' for a reason - it's survival mode for everyone. Most parents report things getting noticeably easier around 3-4 months when babies start sleeping longer stretches and smiling/interacting more. By 6 months, many feel like they've found their rhythm. But 'easier' is gradual, not overnight. Please be gentle with yourself - you're doing the hardest job in the world while sleep-deprived. If feelings of hopelessness persist or worsen, please talk to your doctor about postpartum depression screening. You matter, and there IS light ahead. 💚"
  },

  # Relationships posts
  {
    user: created_users[7], child_profile: child_profiles[9], category: relationships_cat, post_type: "question",
    title: "Partner doesn't help with night wakings",
    body: "I do every single night waking because my husband 'has to work in the morning.' I work from home but I'm still WORKING. We've talked about it but nothing changes. How do you split night duties fairly? Am I being unreasonable to expect help?",
    ai_answer: "You're absolutely not being unreasonable. Working from home IS working, and chronic sleep deprivation affects your ability to function and your mental health. Some fair approaches couples use: alternating nights completely, splitting the night into shifts (10pm-2am / 2am-6am), one parent handles weeknights and the other handles weekends, or whoever didn't do the last waking does the next. It might help to have this conversation during the day (not at 3am!), frame it around 'we need to solve this together,' and be specific about what you need. If conversations aren't working, consider couples counseling - a neutral third party can help. Your needs matter too."
  },
  {
    user: created_users[3], child_profile: child_profiles[4], category: relationships_cat, post_type: "advice",
    title: "Date nights don't have to be fancy",
    body: "We couldn't afford a babysitter so we started doing 'date nights' at home after Noah goes to bed. Order takeout, put phones away, watch a movie together. It's not the same as going out but it's helped us stay connected. Little things matter!"
  },
  {
    user: created_users[4], child_profile: child_profiles[6], category: relationships_cat, post_type: "experience",
    title: "Setting boundaries with in-laws",
    body: "My MIL kept showing up unannounced 'to help' but it stressed me out more. Finally told her we need at least a day's notice for visits. She was hurt at first but now respects it. It's okay to set boundaries, even with family who mean well!"
  },

  # General posts
  {
    user: created_users[6], child_profile: child_profiles[8], category: general_cat, post_type: "experience",
    title: "The unsolicited advice is relentless",
    body: "Took Ava to the grocery store and got comments from THREE strangers. 'She should be wearing socks.' 'Is she warm enough?' 'You're holding her wrong.' Ma'am, she's fine, I'm a nurse, please let me buy my yogurt in peace. 😅"
  },
  {
    user: created_users[5], child_profile: child_profiles[7], category: general_cat, post_type: "question",
    title: "When did you start feeling like a 'real' parent?",
    body: "Ethan is a month old and I still feel like I'm babysitting someone else's kid sometimes. Like someone's going to show up and say 'okay thanks, we'll take it from here.' When did it click for you that you're actually a parent now?",
    ai_answer: "This feeling is so common it has a name - 'imposter syndrome' of parenthood! Most parents report it gradually fading over the first 2-4 months as you develop routines and confidence. For many, there's a specific moment that clicks - the first time baby smiles AT you, when you instinctively know what they need, or when you realize no one knows this particular baby better than you do. Some parents say it took until their baby was older. There's no 'right' timeline. You're doing all the parent things, which means you ARE a parent, even if it doesn't feel that way yet. The feeling will come!"
  },
  {
    user: created_users[9], child_profile: child_profiles[12], category: general_cat, post_type: "milestone",
    title: "Survived my first solo outing!",
    body: "Took Mia to a coffee shop BY MYSELF today. No diaper blowouts, no meltdowns (hers or mine), successfully ordered AND drank a latte while it was still warm. Feeling like a superhero right now. 🦸‍♂️"
  },

  # Posts for older babies (12-24 months)
  {
    user: created_users[8], child_profile: child_profiles[11], category: development_cat, post_type: "milestone",
    title: "First steps at 18 months!",
    body: "Lucas finally took his first independent steps today! He's been cruising furniture for months and I was getting worried. But today he just let go and walked 5 steps to me. Every baby really does have their own timeline. So proud of my little guy! 🎉"
  },
  {
    user: created_users[8], child_profile: child_profiles[11], category: feeding_cat, post_type: "question",
    title: "Picky eating phase - how long does it last?",
    body: "Lucas used to eat EVERYTHING. Now at 18 months he only wants crackers, cheese, and bananas. I've tried hiding veggies, offering variety, not making a big deal of it... nothing works. Please tell me this phase ends eventually?",
    ai_answer: "Picky eating typically peaks between 18 months and 3 years - it's a normal developmental phase related to growing independence and 'food neophobia' (fear of new foods). The good news: most kids naturally expand their palate by age 5-6. What helps: keep offering variety without pressure (it can take 10-15 exposures before a child accepts new food), serve at least one 'safe' food they'll eat at each meal, involve them in food prep, eat together as a family, and avoid making separate meals. Don't stress about nutrition on a day-to-day basis - look at the overall week. Toddler multivitamins can help ease parental worry. This WILL pass!"
  },
  {
    user: created_users[4], child_profile: child_profiles[6], category: development_cat, post_type: "question",
    title: "Tantrums are out of control at 2",
    body: "Jack is 2 and the tantrums are INTENSE. Full body on the floor, screaming, inconsolable. Usually over tiny things like his banana breaking or me closing the fridge. I try to stay calm but sometimes I want to cry too. Is this normal? How do you handle it?",
    ai_answer: "This is completely normal for age 2! Toddlers have big emotions but underdeveloped prefrontal cortexes - they literally can't regulate their feelings yet. The 'broken banana' meltdown is classic because toddlers crave control and predictability. Strategies that help: stay calm (their emotions are not your emergency), validate feelings ('You're so upset the banana broke'), offer comfort without trying to 'fix' it, give choices to increase their sense of control, and ensure basic needs are met (hungry/tired = more meltdowns). During the tantrum, keep them safe and ride it out. It's okay to step away briefly if you need to. This phase peaks around 2-3 and improves significantly by 4."
  },
  {
    user: created_users[4], child_profile: child_profiles[6], category: sleep_cat, post_type: "experience",
    title: "Transitioning to a toddler bed",
    body: "We just moved Jack from crib to toddler bed and it's been... interesting. First few nights he kept getting out every 5 minutes. We stayed consistent with putting him back without engaging much. Night 5 and he's finally staying in bed! Patience is key."
  },
  {
    user: created_users[8], child_profile: child_profiles[11], category: health_cat, post_type: "question",
    title: "Toddler still not talking much at 18 months",
    body: "Lucas says maybe 5 words clearly. He babbles a lot and understands everything we say, follows directions, points at things... but the actual words aren't coming. Pediatrician says to wait until 2 for evaluation. Anyone else's late talker turn out fine?",
    ai_answer: "The signs you describe (understanding language, following directions, pointing, babbling) are all positive indicators! Receptive language developing before expressive language is normal. At 18 months, the typical range is 5-20 words, so Lucas is on the lower end but within range. Many 'late talkers' have a language explosion between 18-24 months. Things that help: narrate your day, read books together, pause and wait for responses, don't anticipate all needs (let him try to communicate). If you want peace of mind before age 2, you can request an early intervention evaluation - they're free in most states and there's no downside to checking. Many kids do catch up on their own!"
  },
  {
    user: created_users[4], child_profile: child_profiles[6], category: general_cat, post_type: "advice",
    title: "Screen time guilt - finding balance",
    body: "I used to be so anti-screen time. Then reality hit. Jack watches about 30-45 min of Bluey while I make dinner and honestly? It's saved my sanity. He's learning words and social situations from it. Giving yourself permission to not be perfect is important."
  },
  {
    user: created_users[8], child_profile: child_profiles[11], category: relationships_cat, post_type: "experience",
    title: "Toddler favoritism is real",
    body: "Lucas is going through a major 'mommy only' phase. He screams if dad tries to help with anything. My husband is so hurt by it. We keep reminding ourselves it's developmental and will pass, but it's hard on both of us. Anyone else dealing with this?"
  },
  {
    user: created_users[4], child_profile: child_profiles[6], category: gear_cat, post_type: "advice",
    title: "Best toddler-proof products",
    body: "Now that Jack is mobile and into EVERYTHING, here's what's saved us: cabinet locks (magnetic ones are best), outlet covers, corner bumpers, toilet lock (yes really), and a good baby gate. The investment is worth not having a heart attack every 5 minutes."
  }
]

posts = posts_data.map do |data|
  post = data[:user].posts.create!(
    child_profile: data[:child_profile],
    category: data[:category],
    post_type: data[:post_type],
    title: data[:title],
    body: data[:body],
    ai_answer: data[:ai_answer],
    published_at: rand(1..14).days.ago
  )
  post
end

puts "Created #{posts.count} posts"

# Create comments
puts "Creating comments..."

comments_data = [
  # Comments on sleep posts
  { post: posts[0], user: created_users[1], body: "We went through this too! It's totally normal. Their sleep patterns change a lot in the first few months. Hang in there!" },
  { post: posts[0], user: created_users[2], body: "The 2 month sleep regression is real. It usually lasts a week or two. You're doing great! ❤️" },
  { post: posts[0], user: created_users[6], body: "Have you tried cluster feeding before bed? Sometimes they wake up hungry. Also, blackout curtains were a game changer for us." },
  { post: posts[1], user: created_users[0], body: "Congratulations! This gives me hope! 🎉" },
  { post: posts[1], user: created_users[3], body: "Twins sleeping through the night is a HUGE milestone. You've earned a celebration!" },
  { post: posts[2], user: created_users[0], body: "We're going through the same thing. Following for advice!" },
  { post: posts[2], user: created_users[6], body: "Have you tried warming a heating pad in the bassinet before putting him down? Remove it before laying him down of course. The warmth helps with the transition." },
  { post: posts[2], user: created_users[3], body: "This phase is SO hard but it does pass. We did contact naps for the first 6 weeks and gradually transitioned. Hang in there!" },
  { post: posts[3], user: created_users[8], body: "Wake windows changed everything for us too! I was letting Harper stay awake way too long and wondering why she was so fussy." },

  # Comments on feeding posts
  { post: posts[4], user: created_users[0], body: "Combo feeding is totally valid! Fed is best. Don't let anyone make you feel guilty for doing what works for your family." },
  { post: posts[4], user: created_users[7], body: "I combo fed both my kids and they're perfectly healthy. The 'nipple confusion' thing is mostly a myth. You're doing great!" },
  { post: posts[5], user: created_users[9], body: "The mess is unreal 😂 We started doing naked meal times (for baby, not us) and it helped with laundry at least!" },
  { post: posts[6], user: created_users[6], body: "Try different bottle brands! Some babies are picky. We went through 5 types before finding one Ava would take." },
  { post: posts[6], user: created_users[4], body: "Have someone else give the bottle while you're out of the room (or even out of the house). Sometimes they refuse if they can smell mom nearby." },
  { post: posts[7], user: created_users[2], body: "Such a sweet milestone! They grow so fast 🥹" },

  # Comments on health posts
  { post: posts[8], user: created_users[3], body: "Try using plain coconut oil! It worked wonders for Noah's rashes. But if it's not better in another day or two, definitely call the pediatrician." },
  { post: posts[8], user: created_users[6], body: "Could be a yeast rash if regular cream isn't working. Those need antifungal treatment. Worth asking your pediatrician about!" },
  { post: posts[9], user: created_users[2], body: "Tylenol about 30 min before helped us. Expect some fussiness and maybe a low fever. Extra cuddles and a quiet day at home. You've got this!" },
  { post: posts[9], user: created_users[7], body: "It's harder on the parents than the babies usually! Mason cried for about 30 seconds then was fine. I cried longer 😅" },
  { post: posts[10], user: created_users[0], body: "So glad you trusted your instincts! This is such an important reminder for all of us." },
  { post: posts[10], user: created_users[5], body: "Thank you for sharing this. I needed to hear it. I've been second-guessing myself constantly." },
  { post: posts[11], user: created_users[8], body: "The NoseFrida is GROSS but so effective. My husband couldn't do it at first but now he's a pro 😂" },

  # Comments on development posts
  { post: posts[12], user: created_users[3], body: "That's amazing! Those first smiles are pure magic." },
  { post: posts[12], user: created_users[7], body: "I remember that moment so clearly. Nothing compares to that first real smile. Enjoy! 💕" },
  { post: posts[13], user: created_users[0], body: "Thank you for sharing this! Going to try the chest method with Emma." },
  { post: posts[13], user: created_users[5], body: "The chest tummy time is genius! Ethan actually tolerates that so much better than the floor." },
  { post: posts[14], user: created_users[2], body: "IT COUNTS! 😂 Those 'mama' babbles are the best sound in the world." },
  { post: posts[15], user: created_users[3], body: "Noah didn't crawl until 9.5 months and he's totally fine now! Some babies skip crawling entirely and go straight to walking. Try not to worry!" },
  { post: posts[15], user: created_users[6], body: "Every baby has their own timeline. If your pediatrician isn't concerned, try not to compare. She'll move when she's ready!" },

  # Comments on gear posts
  { post: posts[16], user: created_users[4], body: "We have the City Select and love it! Folds easily and fits through standard doors. The Uppababy is great too but pricier." },
  { post: posts[17], user: created_users[1], body: "Honestly agree. We barely look at the video monitor. Audio would have been fine and saved us money for diapers 😅" },
  { post: posts[18], user: created_users[3], body: "Ergobaby 360 saved my back! Worth every penny. The lumbar support is amazing." },
  { post: posts[18], user: created_users[6], body: "I have a bad back too and LOVE my Lillebaby. Great support and lots of carrying positions." },

  # Comments on self care posts
  { post: posts[19], user: created_users[1], body: "Yes! Accepting help was the hardest lesson for me too. We can't do it all alone, and that's okay." },
  { post: posts[19], user: created_users[5], body: "I needed to read this today. Going to text my mom right now." },
  { post: posts[20], user: created_users[0], body: "Thank you for sharing. I've been thinking about therapy but felt embarrassed. This helped. 💚" },
  { post: posts[20], user: created_users[2], body: "So proud of you for prioritizing your mental health! It really does make you a better parent." },
  { post: posts[21], user: created_users[4], body: "It gets easier around 3-4 months for most people. You're in the hardest part right now. You WILL feel like yourself again. Promise. ❤️" },
  { post: posts[21], user: created_users[6], body: "Month 3-4 was when I started feeling human again. Hang on. The newborn phase is survival mode and that's okay." },
  { post: posts[21], user: created_users[7], body: "I felt the exact same way. Now at 7 months I actually enjoy this most days. The fog lifts. You're doing amazing. 💚" },

  # Comments on relationships posts
  { post: posts[22], user: created_users[2], body: "You're not being unreasonable! We do shifts - I do 10pm-2am, he does 2am-6am. Both of us get a 4 hour stretch. Game changer." },
  { post: posts[22], user: created_users[4], body: "This was us until I completely broke down. Had a serious conversation and now we alternate nights. It's hard but fair is fair." },
  { post: posts[23], user: created_users[0], body: "Love this idea! We've been so focused on baby we forgot about us. Going to suggest this tonight." },
  { post: posts[24], user: created_users[7], body: "Boundaries are so important! Good for you for speaking up. It's not easy but necessary." },

  # Comments on general posts
  { post: posts[25], user: created_users[3], body: "The audacity of strangers! I've started just saying 'thanks, she has a doctor' and walking away 😂" },
  { post: posts[25], user: created_users[9], body: "I got told my baby was too hot AND too cold in the same grocery trip. Can't win!" },
  { post: posts[26], user: created_users[2], body: "Took me about 2-3 months to stop feeling like an imposter. Now at 4 months I can't imagine life without her." },
  { post: posts[26], user: created_users[7], body: "Honestly? Sometimes I still feel that way at 7 months 😅 But more and more moments feel 'real' now." },
  { post: posts[27], user: created_users[0], body: "You ARE a superhero! Solo outings are terrifying at first. It gets easier!" },
  { post: posts[27], user: created_users[8], body: "The warm latte is the real victory here 🏆☕" }
]

comments = comments_data.map { |data| data[:post].comments.create!(user: data[:user], body: data[:body]) }

puts "Created #{comments.count} comments"

# Create reactions
puts "Creating reactions..."

reaction_types = ['helpful', 'reassuring', 'relatable', 'celebrate']

posts.each do |post|
  # Each post gets 3-8 random reactions from different users
  rand(3..8).times do
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
puts "\nStats:"
puts "  - #{User.count} users"
puts "  - #{ChildProfile.count} child profiles"
puts "  - #{Post.count} posts"
puts "  - #{Comment.count} comments"
puts "  - #{Reaction.count} reactions"
puts "\nYou can log in with:"
puts "  Email: test@example.com"
puts "  Password: password123"
puts "\nOr try any other user (sarah@example.com, michael@example.com, etc.)"
