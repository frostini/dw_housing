class IncomeSource < ActiveRecord::Base
	belongs_to :incomeable, :polymorphic => true
end