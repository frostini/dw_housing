class FloorPlan < ActiveRecord::Base
	belongs_to :dwelling
	belongs_to :dwelling_category
end