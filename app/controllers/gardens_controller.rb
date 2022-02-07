class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @gardens = Garden.all
  end
end
