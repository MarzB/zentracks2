class Trip < ActiveRecord::Base
  has_many :itineraries , :class_name => "Itinerary", :foreign_key => "trip_id"
  belongs_to :user_name , :class_name => "User", :foreign_key => "user_name_id"
  has_many :locations, :through => :itineraries

  validates :trip_name, :uniqueness => { :scope => :trip_name }

end
