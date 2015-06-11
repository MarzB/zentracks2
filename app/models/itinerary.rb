class Itinerary < ActiveRecord::Base
  validates :arrival_date_time, :presence => true
  validates :departure_date_time, :presence => true
  validates :trip_id, :presence => true

  validates :location_id, :uniqueness => { :scope => :arrival_date_time }

  belongs_to :location
  belongs_to :trip

end
