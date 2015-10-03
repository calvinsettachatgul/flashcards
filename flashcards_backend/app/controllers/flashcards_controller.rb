class FlashcardsController < ApplicationController

  def index
    @flashcards =  Flashcard.all
    render json: @flashcards
  end

  def show
    id = params["id"]
    @flashcard = Flashcard.find(id)
  end

end
