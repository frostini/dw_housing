class Dwelling < ActiveRecord::Base
	has_one :address, :as => :addressable, dependent: :destroy
	has_many :contacts, dependent: :destroy
	has_many :floor_plans, dependent: :destroy
end