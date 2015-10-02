class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :name
      t.string :description
      t.string :question
      t.string :answer
      t.string :tags

      t.timestamps null: false
    end
  end
end
