class Flashcard < ActiveRecord::Base
  def Flashcard.generate_lorem
    flashcard = Flashcard.new
    flashcard.name = Faker::Lorem.word
    flashcard.question = Faker::Lorem.sentence
    flashcard.answer = Faker::Lorem.sentence
    flashcard.tags = Faker::Lorem.words
    flashcard.save
    flashcard.description = Faker::Lorem.word + " " + flashcard.id.to_s

    flashcard
  end
end
