class BoardsController < ApplicationController
  before_action :set_board, only: [:show]

  def create
    board = Board.new(name: board_params[:name])

    if board.save
      render json: board, status: :created
    else
      render json: board.errors, status: :bad_request
    end
  end

  def show
    render json: @board, status: :ok
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
