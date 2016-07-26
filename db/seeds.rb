# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




user_1 = User.new({
	email: "marlon@mail.com",
	password: "password",
	password_confirmation: "password",
	first_name: "Marlon",
	last_name: "Frausto",
	last_four: 1234,
	user_type: "User::Applicant",
	admin: true
	})
user_1.save

user_2 = User.new({
	email: "hello@mail.com",
	password: "password",
	password_confirmation: "password",
	first_name: "Hello",
	last_name: "Visitor",
	last_four: 1234,
	user_type: "User::Visitor",
	admin: false
	})
user_2.save

address_1 = user_1.addresses.new({
      line_1: "537 Octavia St.",
      city: "San Francisco",
      state: "CA",
      zipcode: 94102,
      country: "USA",
      latitude: 37.7773228,
      longitude: -122.4272052
})
address_1.save

address_3 = user_2.addresses.new({
      line_1: "1415 Larkin St.",
      city: "San Francisco",
      state: "CA",
      zipcode: 94109,
      country: "USA",
      latitude: 37.7910904,
      longitude: -122.419305
})
address_3.save

dwelling = Dwelling.new({
			dwelling_name: "Sample Dwelling",
			dwelling_description: "This dwelling is in the history fillmore district"
	})
dwelling.save

floor_plan = FloorPlan.new({
      dwelling_id: dwelling.id,
      bedrooms: 1,
      baths: 1,
      occupant_min: 1,
      occupant_max: 2,
      mo_rent_min: 500,
      mo_rent_max: 800,
      sq_ft_min: 450,
      sq_ft_max: 520
})
floor_plan.save

floor_plan_2 = FloorPlan.new({
      dwelling_id: dwelling.id,
      bedrooms: 2,
      baths: 2,
      occupant_min: 2,
      occupant_max: 3,
      mo_rent_min: 600,
      mo_rent_max: 900,
      sq_ft_min: 550,
      sq_ft_max: 650
})
floor_plan_2.save




address_2 = Address.new({
      line_1: "1350 Golden Gate Ave.",
      line_2: "Unit #5",
      city: "San Francisco",
      state: "CA",
      zipcode: 94115,
      country: "USA",
      latitude: 37.779697,
      longitude: -122.4351404,
      addressable_type: "Dwelling",
      addressable_id: dwelling.id
})
address_2.save


contact = Contact.new({
      first_name: "Joe",
      last_name: "Schmoe",
      phone_number: 5674455676,
      email_address: "joe@schmoe.com",
      dwelling_id: dwelling.id
      })

contact.save



address_4 = Address.new({
      line_1: "1350 Golden Gate Ave.",
      line_2: "Unit #5",
      city: "San Francisco",
      state: "CA",
      zipcode: 94115,
      country: "USA",
      latitude: 37.779697,
      longitude: -122.4351404,
      addressable_type: "Contact",
      addressable_id: contact.id
})
address_4.save
# 3001 Laguna St
# San Francisco,
# CA,
# 94123
# 37.7989015
# -122.4309949

# address_1 = Address.


# Artis Building

# 537 Octavia St.
# San Francisco, CA 94102

# 37.7773228,-122.4272052



# Awesomeness Castle

# 1350 Golden Gate Ave.
# San Francisco, CA 94115

# 37.779697,-122.4351404



# Contraband Coffee Bar
# 1415 Larkin St.
# San Francisco, CA 94109

# 37.7910904,-122.419305




