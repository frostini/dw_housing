class Address < ActiveRecord::Base
	belongs_to :addressable, :polymorphic => true

	has_many :users, through: :user_addresses
	has_many :user_addresses

# scope :is_dwelling, -> (addres_type = "Dwelling") { where("addressable_type like ?", addres_type)}
# belongs_to :dwelling, -> { where(address: {addressable_type: 'Dwelling'}) }, foreign_key: 'addressable_id'
# belongs_to :dwelling, -> { includes(:address).where(addresses: {addressable_type: "Dwelling"})}, foreign_key: :addressable_id



  geocoded_by :full_street_address
  after_validation :geocode, :reverse_geocode
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.line_1  = geo.street_address
      obj.city    = geo.city
      obj.state   = geo.state
      obj.zipcode = geo.postal_code
      obj.country = geo.country_code
    end
  end

  def full_street_address
  	if line_1.present? && zipcode.present? || city.present?
  		return line_1 + ', ' + city + ', ' + state + ', ' + zipcode 
  	else
  		nil
  	end
  end

end