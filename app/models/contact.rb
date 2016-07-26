class Contact < ActiveRecord::Base
	belongs_to :dwelling
	has_one :address, :as => :addressable, dependent: :destroy
end