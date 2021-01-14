# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#RESTE ALL THE DATA INTO DATABASE
Article.destroy_all

10.times do |index|
  article = Article.new
  article.id = index + 1
  article.name = Faker::Name.name
  article.content = Faker::Hacker.say_something_smart
  article.save
end
puts "10 articles ont été créés!"
tp Article.all, :id, :name, :content