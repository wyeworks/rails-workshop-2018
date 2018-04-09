class CardsController < ApplicationController
  before_action :set_list, only: [:create]
  before_action :set_card, only: [:update]

  def create
    card = @list.cards.new(text: card_params[:text])

    if card.save
      render json: card, status: :created
    else
      render json: card.errors, status: :bad_request
    end
  end

  def update
    if @card.update(card_params)
      render json: @card, status: :ok
    else
      render json: @card.errors, status: :bad_request
    end
  end

  private

  def card_params
    params.require(:card).permit(:text)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
