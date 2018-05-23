class BoardsController < ApplicationController
  before_action :set_board, only: [:show]

  def index
    render json: Board.all
  end

  def create
    board = Board.new(name: board_params[:name])

    # Create default lists
    board.lists.build(name: 'To Do')
    board.lists.build(name: 'Personal')

    if board.save
      render json: board, include: :lists, status: :created
    else
      render json: board.errors, status: :bad_request
    end
  end

  def show
    render json: @board, include: { lists: { include: :cards } }
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def set_board
    @board = Board.where(id: params[:id]).includes(lists: :cards).first
  end
end
