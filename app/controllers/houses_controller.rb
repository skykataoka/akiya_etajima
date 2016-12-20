class HousesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @pin = Gmaps4rails.build_markers(@house) do |house, marker|
      marker.lat house.latitude
      marker.lng house.longitude
      marker.infowindow house.address
    end
  end

  def new
  end

  def create
  end
end
