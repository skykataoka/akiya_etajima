class HousesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
  end

  def new
  end

  def create
  end
end
