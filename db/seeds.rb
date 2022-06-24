# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seeds for users
users = ['Naoyuki', 'Masami', 'Takehiro', 'Alanis']

users.each do |user|
  User.create!(
    email: "#{user}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end

# Seeds for posts
areas = ['Smoke Bluffs', 'Grandwall', 'Murrin Park', 'Cheakamus Canyon']

10.times do |n|
  Post.create!(
    date: Date.new.strftime('%Y-%m-%d'),
    start_time: Time.new.strftime('%H:%M'),
    end_time: Time.new.strftime('%H:%M'), 
    area: areas[rand(4)],
    kind_of_climbing: 0,
    description: "test#{n}#",
    user_id: User.find(rand(3) + 1).id
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
