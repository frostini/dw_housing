class IncomeSource < ActiveRecord::Base
	belongs_to :incomeable, :polymorphic => true

	belongs_to :payment_period
	belongs_to :income_source_category

end