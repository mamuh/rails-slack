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

channels = %w(general react paris dbchannel)
channels.each do |channel|
  Channel.create(name: channel)
end

userEmails = %w(mari@bis.com davis@bis.com bis@bis.com)
userEmails.each do |email|
  User.create(email: email, password: 'password', nickname: email.partition('@').first)
end

messages1 = [
  "Olaaa",
  "Hey tudo bem?",
  "Teste teste",
  "Mais um teste"
]

messages2 = [
  "Hey there",
  "Testing",
  "React channel"
]

messages3 = [
  "CHANO",
  "Dedeee",
  "Paris channel"
]

messages4 = [
  "db channel, pulling messages and channels from postgresql"
]


messages1.each do |message|
  Message.create(content: message, channel: Channel.find_by_name("general"), user: User.first)
end

messages2.each do |message|
  Message.create(content: message, channel: Channel.find_by_name("react"), user: User.last)
end

messages3.each do |message|
  Message.create(content: message, channel: Channel.find_by_name("paris"), user: User.first)
end

messages4.each do |message|
  Message.create(content: message, channel: Channel.find_by_name("dbchannel"), user: User.last)
end
