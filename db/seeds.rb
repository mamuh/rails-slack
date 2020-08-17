# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
User.destroy_all
Channel.destroy_all

channels = %w(general react paris)
channels.each do |channel|
  Channel.create(name: channel)
end

userEmails = %w(mari@bis.com davis@bis.com bis@bis.com)
userEmails.each do |email|
  User.create(email: email, password: 'password')
end

messages = [
  "Olaaa",
  "Hey tudo bem?",
  "Teste teste",
  "Mais um teste"
]

messages.each do |content|
  Message.create(content: content, channel: Channel.first, user: User.first)
end