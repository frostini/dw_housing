class IncomeSource < ActiveRecord::Base
	belongs_to :incomeable, :polymorphic => true

	belongs_to :payment_period

	# has_many	:frequency_of_payments, through: :payment_periods
	# has_many 	:payment_periods

end