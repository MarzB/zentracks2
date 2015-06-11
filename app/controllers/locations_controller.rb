class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new
    @location.country = params[:country]
    @location.position = params[:position]
    @location.trip_id = params[:trip_id]
    @location.city = params[:city]
    @location.state = params[:state]

    if @location.save
      redirect_to "/locations", :notice => "Location created successfully."
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    @location.country = params[:country]
    @location.position = params[:position]
    @location.trip_id = params[:trip_id]
    @location.city = params[:city]
    @location.state = params[:state]

    if @location.save
      redirect_to "/locations", :notice => "Location updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])

    @location.destroy

    redirect_to "/locations", :notice => "Location deleted."
  end
end
