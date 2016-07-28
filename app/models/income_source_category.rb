class IncomeSourceCategory < ActiveRecord::Base
	has_many :users, through: :user_income_source_categories
	has_many :user_income_source_categories
end