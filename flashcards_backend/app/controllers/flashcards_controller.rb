class FlashcardsController < ApplicationController

#           Prefix Verb   URI Pattern                    Controller#Action
#     flashcards GET    /flashcards(.:format)          flashcards#index
#                POST   /flashcards(.:format)          flashcards#create
#  new_flashcard GET    /flashcards/new(.:format)      flashcards#new
# edit_flashcard GET    /flashcards/:id/edit(.:format) flashcards#edit
#      flashcard GET    /flashcards/:id(.:format)      flashcards#show
#                PATCH  /flashcards/:id(.:format)      flashcards#update
#                PUT    /flashcards/:id(.:format)      flashcards#update
#                DELETE /flashcards/:id(.:format)      flashcards#destroy

  def index
    @flashcards =  Flashcard.all
    @lorem_card = Flashcard.generate_lorem
    # render json: @flashcards
  end

  def create
    p "made a card"
    p params
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

  def new
    @flashcard = Flashcard.new
  end

  def edit
    id = params["id"]
    @flashcard = Flashcard.find(id)

  end

  def show
    id = params["id"]
    @flashcard = Flashcard.find(id)
    respond_to do |format|

      format.html # being explicit here, render not really required

      format.json { render json: @flashcard }


    end

  end

  def update
    id = params["id"]
    @flashcard = Flashcard.find(id)
    @flashcard_config = params["flashcard"]
    @flashcard.name = @flashcard_config['name']
    @flashcard.description = @flashcard_config['description']
    @flashcard.question = @flashcard_config['question']
    @flashcard.answer = @flashcard_config['answer']
    @flashcard.tags = @flashcard_config['tags']
    @flashcard.save
    render "flashcards/show"
  end

  def destroy
    @flashcards = Flashcard.all
    id = params["id"]
    @flashcard = Flashcard.find(id)
    Flashcard.destroy(id)
    # render :index
    # redirect_to :back
    redirect_to :action => "index"
  end



end
