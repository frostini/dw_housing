class Address < ActiveRecord::Base
	belongs_to :addressable, :polymorphic => true
	has_many :users, through: :user_addresses
	has_many :user_addresses
end