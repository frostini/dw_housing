class HouseholdMember < ActiveRecord::Base
	belongs_to :user
	has_many :income_sources, :as => :incomeable
	belongs_to :household_relationship
end