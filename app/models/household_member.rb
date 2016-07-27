class HouseholdMember < ActiveRecord::Base
	belongs_to :user
	has_many :income_sources, :as => :incomeable
end