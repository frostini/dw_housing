class Amenity < ActiveRecord::Base
	has_many :dwellings, through: :dwelling_features
	has_many :dwelling_features
end