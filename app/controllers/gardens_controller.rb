class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = Garden.all
  end

  def show
    @review = Review.new
  end

  def edit
  end

  def update
    @garden.update(strong_params)
    redirect_to garden_path(@garden)
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(strong_params)
    @garden.user = @user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    @garden.delete
    redirect_to gardens_path
  end

  private

  def strong_params
    params.require(:garden).permit(:title, :address, :price, { photos: [] }, :description) #order matters if you do not use {} for hash
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end

end
