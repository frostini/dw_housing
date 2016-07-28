class Gender < ActiveRecord::Base
	has_many :household_members
	has_many :users
end