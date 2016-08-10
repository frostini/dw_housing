class FloorPlan < ActiveRecord::Base
include Filterable

	belongs_to :dwelling
	belongs_to :dwelling_category

	scope :bedrooms, -> (bedroom_count) { where( "bedrooms >= ?", bedroom_count) }
	scope :baths, -> (bath_count) { where("baths >= ?", bath_count) }
	scope :occupants, -> (occupant_count) {where("? BETWEEN occupant_min AND occupant_max", occupant_count )}
	scope :mo_rent_price, -> (mo_unit_price) { where("? BETWEEN mo_rent_min AND mo_rent_max", mo_unit_price) }

end