class FlashcardsController < ApplicationController

  def index
    @flashcards =  Flashcard.all
    render json: @flashcards
  end

  def show
    id = params["id"]
    @flashcard = Flashcard.find(id)
  end

  def new
    @flashcard = Flashcard.new
  end

  def create
    p "******************"
    @flashcard_config = params["flashcard"]
    @new_flashcard = Flashcard.new()
    @new_flashcard.name = @flashcard_config['name']
    @new_flashcard.description = @flashcard_config['description']
    @new_flashcard.question = @flashcard_config['question']
    @new_flashcard.answer = @flashcard_config['answer']
    @new_flashcard.tags = @flashcard_config['tags']
    @new_flashcard.save
    @flashcard = @new_flashcard
    render "flashcards/show"
  end

end
