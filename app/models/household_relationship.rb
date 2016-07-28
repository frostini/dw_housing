class HouseholdRelationship < ActiveRecord::Base
	has_many :household_members
end
