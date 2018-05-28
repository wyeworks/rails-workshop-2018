class CardsController < ApplicationController
  before_action :set_list
  before_action :set_card, only: [:show, :update, :destroy]

  # GET /cards
  def index
    @cards = @list.cards

    render json: @cards
  end

  # GET /cards/1
  def show
    render json: @card
  end

  # POST /cards
  def create
    @card = @list.cards.new(card_params)

    if @card.save
      render json: @card, status: :created, location: [@list.board, @list, @card]
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
  end

  private

    def set_list
      @list = List.find(params[:list_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = @list.cards.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:text, :list_id)
    end
end
