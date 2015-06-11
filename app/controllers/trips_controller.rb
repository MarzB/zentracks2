class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = Trip.where({ :user_id => current_user.id })
  end

  def show
    @trip = Trip.find(params[:id])
    @itinerary = Itinerary.new(trip_id: @trip.id)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.user_id = current_user.id
    @trip.trip_name = params[:trip_name]

    if @trip.save
      redirect_to "/trips", :notice => "Trip created successfully."
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    @trip.user_id = current_user.id
    @trip.trip_name = params[:trip_name]

    if @trip.save
      redirect_to "/trips", :notice => "Trip updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])

    @trip.destroy

    redirect_to "/trips", :notice => "Trip deleted."
  end
end
