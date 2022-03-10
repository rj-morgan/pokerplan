class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new(deck_id: params[:deck_id])
  end

  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to @card.deck
    else
      render :new
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to deck_path(@card.deck)
    else
      render :new
    end
  end

  # turbo_stream persists the http method after redirect (ie tries to delete the deck!)
  # specifying the http status code prevents this
  def destroy
    card = Card.find(params[:id])

    flash[:notice] = 'Card deleted'
    card.destroy
    redirect_to deck_path(Deck.find(params[:deck_id])), status: 303
  end

  private

  def card_params
    params.require(:card).permit(:value, :unit, :deck_id)
  end
end
