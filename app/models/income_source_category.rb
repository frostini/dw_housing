class IncomeSourceCategory < ActiveRecord::Base
	has_many :income_sources
end