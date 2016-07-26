class UserAddress < ActiveRecord::Base
	belongs_to :ref_address_type
	belongs_to :user
	belongs_to :address
end