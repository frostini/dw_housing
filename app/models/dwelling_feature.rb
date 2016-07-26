class DwellingFeature < ActiveRecord::Base
	belongs_to :amenity
	belongs_to :dwelling
end