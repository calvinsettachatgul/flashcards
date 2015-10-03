class FlashcardsController < ApplicationController

  def index
    @flashcards =  Flashcard.all
    render json: @flashcards
  end

  def show
    id = params["id"]
    @flashcard = Flascard.find(id)
  end

end
