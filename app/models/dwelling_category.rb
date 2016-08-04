class DwellingCategory < ActiveRecord::Base
	has_many :floor_plans
end