# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@public_feed = Feed.create!(name: "Public")
@private_feed = Feed.create!(name: "Private")

20.times do |i|
  username = Faker::Internet.username
  email = "jdoe#{i}@example.com"
  password = "foobar12"
  @user = User.create!(username: username, email: email, password: password, password_confirmation: password)
  @user.confirm
  20.times do |i|
    @user.posts.create!(title: Faker::Lorem.sentence(word_count: 5), body: Faker::Lorem.paragraph(sentence_count: 20, random_sentences_to_add: 10), feed_id: @public_feed.id)
  end
end