# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seeds for users
users = %w[Naoyuki Masami Takehiro Alanis]

users.each do |user|
  User.create!(
    email: "#{user}@example.com",
    name: user,
    password: 'password',
    password_confirmation: 'password'
  )
end

# Seeds for posts
areas = ['Smoke Bluffs', 'Grandwall', 'Murrin Park', 'Cheakamus Canyon']
descriptions = [
  'I am looking for a partner for next Monday. Shall we go to some trad?',
  'Hi, I am visiting in Squamish for a month. Please rope up with me. I would like to sport.',
  'I usually climb 5.9 to 5.10s on trad. I can go climbing only weekend. Thank you.',
  'Hello, guys. Please teach me climbing. I am a beginner.',
  'My name is John. My favorite climb is bouldering. Who want to go with me?',
  'I found a big project. It seems like 5.14. Who wants FA with me?',
  'Need a partner on this Friday! I climb 5.11 to 5.12 sports.',
  'I found a pair of climbing shoes at somewher in Area44. Message me with the size and model.',
  'I have just moved to Squamish 1 week ago. Please take me to the crag.',
  'My partner is injured. So I need another partner for this season. Message me.'
]

10.times do |n|
  Post.create!(
    date: Date.new.strftime('%Y-%m-%d'),
    start_time: Time.new.strftime('%H:%M'),
    end_time: Time.new.strftime('%H:%M'),
    area: areas[rand(4)],
    kind_of_climbing: 0,
    description: descriptions[n],
    user_id: User.find(rand(1..3)).id
  )
end

# posts = Post.all
# posts.each do |p|
#   p.chats.create(host_user_id: User.find(rand(2) + 1).id,
#                  guest_user_id: User.find(rand(2) + 1).id)
# end
#
# chats = Chat.all
# chats.each do |c|
#   c.messages.create(user_id: c.guest_user_id, body: 'test test test')
# end
