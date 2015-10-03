# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


flashcard1 = Flashcard.new

flashcard1.name = "flashcard1"

flashcard1.question = "flashcard1 question"
flashcard1.answer = "flashcard1 answer"

puts flashcard1

flashcard1.save

@counter = 1
10.times do
  flashcard = Flashcard.new
  flashcard.name = Faker::Lorem.word
  flashcard.description = Faker::Lorem.word + " " + flashcard.id
  flashcard.question = Faker::Lorem.sentence
  flashcard.answer = Faker::Lorem.sentence
  flashcard.save
  puts "created a new flashcard #{@counter}"
  @counter = @counter + 1
end
