class Dwelling < ActiveRecord::Base
	has_one :address, :as => :addressable, dependent: :destroy
  has_many :contacts, :as => :contactable
	has_many :amenities, through: :dwelling_features
	has_many :dwelling_features
	has_many :dwelling_details, dependent: :destroy
	has_many :floor_plans, dependent: :destroy

	 has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end