class Contact < ActiveRecord::Base
# belongs_to :contactable, polymorphic: true
  has_many :users, through: :user_contacts
  has_many :user_contacts
	# belongs_to :dwelling
	# has_one :address, :as => :addressable, dependent: :destroy
end