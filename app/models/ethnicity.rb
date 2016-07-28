class Ethnicity < ActiveRecord::Base
	has_many :users
	has_many :household_members
end