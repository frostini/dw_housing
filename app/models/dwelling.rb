class Dwelling < ActiveRecord::Base
	has_one :address, :as => :addressable, dependent: :destroy
	has_many :contacts, dependent: :destroy
	has_many :floor_plans, dependent: :destroy

	has_many :amenities, through: :dwelling_features
	has_many :dwelling_features

	has_many :dwelling_details, dependent: :destroy
end