# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#u = User.create!(username: 'steve lee', email: "steve@email.com", password: "dongta00")
#Comment.create!(body: "i'm second", user: u, article: Article.first)

10.times do
  user = Article.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs, user_id: rand(1...4))
end 