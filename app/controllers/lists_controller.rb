class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  before_action :set_board, only: [:create]

  def create
    list = @board.lists.new(name: list_params[:name])

    if list.save
      render json: list, include: :cards, status: :created
    else
      render json: list.errors, status: :bad_request
    end
  end

  def show
    render json: @list, status: :ok
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def set_board
    @board = Board.find(params[:board_id])
  end
end
