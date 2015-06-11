class Location < ActiveRecord::Base
  has_many :itineraries , :class_name => "Itinerary", :foreign_key => "location_id"
  belongs_to :trip

  validates :country, :presence => true
  validates :city, :presence => true
end
