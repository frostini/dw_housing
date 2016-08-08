class Dwelling < ActiveRecord::Base
	has_one :address, :as => :addressable, dependent: :destroy
	# has_many :contacts, dependent: :destroy
  has_many :contacts, :as => :contactable

	has_many :amenities, through: :dwelling_features
	has_many :dwelling_features

	has_many :dwelling_details, dependent: :destroy

	has_many :floor_plans, dependent: :destroy


# scope :sought_floor_plan, Proc.new{ |search_term|
#   joins(:categories).where("upper(categories.title) like ?", search_term.upcase) 
# }
end