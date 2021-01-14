# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#REST ALL DATAD INTO DATABASE
Post.destroy_all

#Creation of 10 post
10.times do |index|
  post = Post.new
  post.id = index + 1
  post.author = Faker::Name.name
  post.content = Faker::Hacker.say_something_smart
  post.save
end
puts "10 posts was created"
puts tp Post.all, :id, :author, :content