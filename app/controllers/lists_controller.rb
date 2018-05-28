class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :update, :destroy]

  # GET /lists
  def index
    @lists = @board.lists

    render json: @lists
  end

  # GET /lists/1
  def show
    render json: @list
  end

  # POST /lists
  def create
    @list = @board.lists.new(name: list_params[:name])

    if @list.save
      render json: @list, include: :cards, status: :created, location: [@board, @list]
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
  end

  private

    def set_board
      @board = Board.find(params[:board_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = @board.lists.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:name)
    end
end
