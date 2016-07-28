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

inc_s_cat_1 = IncomeSourceCategory.new({
            inc_cat_name: "w-2",
      inc_cat_description: "this is a paystub for an employee"
      })
inc_s_cat_1.save
inc_s_cat_2 = IncomeSourceCategory.new({
            inc_cat_name: "w-2",
      inc_cat_description: "this is a paystub for an employee"
      })
inc_s_cat_2.save


h_exp = HouseholdExpense.new({
      expense_kind: "Gas",
      entity: "SDGE",
      frequency: "bi monthly",
      amount: 4456.43,
      user_id: user_1.id
})
h_exp.save
pay_per_1 = PaymentPeriod.new({
            payment_period_type: "bi-weekly"
      })
pay_per_1.save
pay_per_2 = PaymentPeriod.new({
            payment_period_type: "monthly"
      })
pay_per_2.save
inc_source_1 = IncomeSource.new({
      source: "job",
      amount_per_payment: 234,
      source_proof_details: "two paystubs",
      incomeable_type: "User", 
      incomeable_id: user_2.id,
      payment_period_id: pay_per_1.id,
      income_source_category_id: inc_s_cat_2.id
})
inc_source_1.save
inc_source_2 = IncomeSource.new({
      source: "self",
      amount_per_payment: 3343,
      source_proof_details: "P & L",
      incomeable_type: "User", 
      incomeable_id: user_2.id,
      payment_period_id: pay_per_2.id,
      income_source_category_id: inc_s_cat_1.id
})
inc_source_2.save

# freq_of_payment = FrequencyOfPayment.new({
#             payment_period_type: "Bi-Weekly"
#       })
# freq_of_payment.save
h_rel = HouseholdRelationship.new({
            relation_title: "Spouce"
      })
h_rel.save
ho_mem = HouseholdMember.new({
      first_name: "Ima",
      last_name: "Member",
      relationship: "sister",
      dob: Date.new(2001,2,3),
      gender: "female",
      ethnicity: "same",
      user_id: user_1.id,
      household_relationship_id: h_rel.id
      })
ho_mem.save


inc_source_3 = IncomeSource.new({
      source: "hustlin",
      amount_per_payment: 3454,
      source_proof_details: "paystubs",
      incomeable_type: "HouseholdMember", 
      incomeable_id: ho_mem.id,
      payment_period_id: pay_per_2.id,
      income_source_category_id: inc_s_cat_2.id
})
inc_source_3.save




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


am = Amenity.new(amenity_name: "stuff")
am.save
yes= DwellingFeature.new(amenity_id: am.id, dwelling_id: dwelling.id, has_amenity?: true)
yes.save

dt = DwellingDetail.new(dwelling_id: dwelling.id, key: "Deposit", value: "Need to have a deposit of $200 before moving in.")
dt.save


ref_ad_type = RefAddressType.new({
      address_type_code: "mailing",
      address_type_description: "this is for mailing stuff"
      })
ref_ad_type_1 = RefAddressType.new({
      address_type_code: "present address",
      address_type_description: "this is their current address"
      })
ref_ad_type.save
ref_ad_type_1.save




address_1 = Address.new({
      line_1: "537 Octavia St.",
      city: "San Francisco",
      state: "CA",
      zipcode: 94102,
      country: "USA",
      latitude: 37.7773228,
      longitude: -122.4272052
      # addressable_type: "User",
      # addressable_id: contact.id
})
address_1.save

use_add = UserAddress.new({
      address_id: address_1.id,
      user_id: user_1.id,
      ref_address_type_id: ref_ad_type_1.id
      })
use_add.save

use_add_1 = UserAddress.new({
      address_id: address_1.id,
      user_id: user_1.id,
      ref_address_type_id: ref_ad_type.id
      })
use_add_1.save



# address_3 = user_2.addresses.new({
#       line_1: "1415 Larkin St.",
#       city: "San Francisco",
#       state: "CA",
#       zipcode: 94109,
#       country: "USA",
#       latitude: 37.7910904,
#       longitude: -122.419305
# })
# address_3.save




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




