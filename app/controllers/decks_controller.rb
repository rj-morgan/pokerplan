class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def new
    @deck = Deck.new
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      flash.now[:notice] = 'Deck was successfully created.'
      redirect_to @deck
    else
      render :new
    end
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update(deck_params)
      flash.now[:notice] = 'Deck was successfully upated.'
      redirect_to @deck
    else
      render :new
    end
  end

  def destroy
    deck = Deck.find(params[:id])

    flash[:notice] = "Deck #{deck.name} was successfully deleted."
    deck.destroy
    redirect_to action: :index
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
