class ItinerariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @itineraries = Itinerary.all

    @itineraries = @itineraries.all.sort_by {|obj| obj.arrival_date_time }
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def new
    @itinerary = Itinerary.new(trip_id: params[:trip_id])
  end

  def create
    @itinerary = Itinerary.new
    @itinerary.arrival_date_time = Chronic.parse(params[:arrival_date_time])
    @itinerary.departure_date_time = Chronic.parse(params[:departure_date_time])
    @itinerary.street_address = params[:street_address]
    @itinerary.location_id = params[:location_id]
    @itinerary.trip_id = params[:trip_id]

    if @itinerary.save
      redirect_to "/trips/#{@itinerary.trip_id}", :notice => "Itinerary created successfully."
    else
      render 'new'
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])

    @itinerary.arrival_date_time = params[:arrival_date_time]
    @itinerary.departure_date_time = params[:departure_date_time]
    @itinerary.street_address = params[:street_address]
    @itinerary.location_id = params[:location_id]
    @itinerary.trip_id = params[:trip_id]

    if @itinerary.save
      redirect_to "/trips/#{@itinerary.trip_id}", :notice => "Itinerary updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])

    @itinerary.destroy

    respond_to do |format|
      format.html do
        redirect_to "/itineraries", :notice => "Itinerary deleted."
      end
      format.js
    end
  end

end
