# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
pref = Preference.new({
      preference_name: "Veteran"  
      })
pref.save
gen = Gender.new({gender_group: "female"})
gen.save
gen_1 = Gender.new({gender_group: "male"})
gen_1.save
eth = Ethnicity.new({
      ethnicity_group: "Colors"
      })
eth.save
user_1 = User.new({
	email: "marlon@mail.com",
	password: "password",
	password_confirmation: "password",
	first_name: "Marlon",
	last_name: "Frausto",
	last_four: 1234,
	user_type: "User::Applicant",
      ethnicity_id: eth.id,
	admin: true,
      gender_id: gen_1.id
	})
user_1.save
u_pref = UserPreference.new({
            user_id: user_1.id,
            preference_id: pref.id
      })
u_pref.save

user_2 = User.new({
	email: "hello@mail.com",
	password: "password",
	password_confirmation: "password",
	first_name: "Hello",
	last_name: "Visitor",
	last_four: 1234,
	user_type: "User::Visitor",
      ethnicity_id: eth.id,
	admin: false,
      gender_id: gen.id
	})
user_2.save
u_pref_1 = UserPreference.new({
            user_id: user_2.id,
            preference_id: pref.id
      })
u_pref_1.save
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


h_rel = HouseholdRelationship.new({
            relation_title: "Spouce"
      })
h_rel.save

ho_mem = HouseholdMember.new({
      first_name: "Ima",
      last_name: "Member",
      dob: Date.new(2001,2,3),
      gender_id: gen.id,
      ethnicity_id: eth.id,
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

d_cat = DwellingCategory.new({name:"Apartment"})
d_cat.save
floor_plan = FloorPlan.new({
      dwelling_id: dwelling.id,
      bedrooms: 1,
      baths: 1,
      occupant_min: 1,
      occupant_max: 2,
      mo_rent_min: 500,
      mo_rent_max: 800,
      sq_ft_min: 450,
      sq_ft_max: 520,
      dwelling_category_id: d_cat.id
})
floor_plan.save

floor_plan_2 = FloorPlan.new({
      dwelling_id: dwelling.id,
      bedrooms: 4,
      baths: 3,
      occupant_min: 2,
      occupant_max: 4,
      mo_rent_min: 600,
      mo_rent_max: 900,
      sq_ft_min: 550,
      sq_ft_max: 650,
      dwelling_category_id: d_cat.id
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
      contact_category: "email"
      })
contact.save

u_of_c = UserContact.new({
      user_id: user_2.id,
      contact_id: contact.id,
      value: "somes@email.com"
      })
u_of_c.save


am = Amenity.new(amenity_name: "stuff")
am.save
am = Amenity.new(amenity_name: "another")
am.save
am = Amenity.new(amenity_name: "yet")
am.save
am = Amenity.new(amenity_name: "ahh")
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
      user_id: user_2.id,
      ref_address_type_id: ref_ad_type.id
      })
use_add_1.save

dwelling_0 = Dwelling.new({
                  dwelling_name: "Dwelling #00",
                  dwelling_description: "This dwelling dwelling #00 description"
      })
dwelling_0.save
dwelling_11 = Dwelling.new({
                  dwelling_name: "Dwelling #11",
                  dwelling_description: "This dwelling dwelling #11 description"
      })
dwelling_11.save
dwelling_22 = Dwelling.new({
                  dwelling_name: "Dwelling #22",
                  dwelling_description: "This dwelling dwelling #22 description"
      })
dwelling_22.save
dwelling_33 = Dwelling.new({
                  dwelling_name: "Dwelling #33",
                  dwelling_description: "This dwelling dwelling #33 description"
      })
dwelling_33.save
dwelling_44 = Dwelling.new({
                  dwelling_name: "Dwelling #44",
                  dwelling_description: "This dwelling dwelling #44 description"
      })
dwelling_44.save
dwelling_55 = Dwelling.new({
                  dwelling_name: "Dwelling #55",
                  dwelling_description: "This dwelling dwelling #55 description"
      })
dwelling_55.save

# d_cat = DwellingCategory.new({name:"Apartment"})
# d_cat.save
# floor_plan = FloorPlan.new({
#       dwelling_id: dwelling.id,
#       bedrooms: 1,
#       baths: 1,
#       occupant_min: 1,
#       occupant_max: 2,
#       mo_rent_min: 500,
#       mo_rent_max: 800,
#       sq_ft_min: 450,
#       sq_ft_max: 520,
#       dwelling_category_id: d_cat.id
# })
# floor_plan.save

address_7 = Address.new({
line_1: "315 Linden St",
city: "San Francisco",
state: "CA", 
zipcode: 94102,
addressable_type: "Dwelling",
addressable_id: dwelling_0.id
})
address_7.save
floor_plan = FloorPlan.new({
      dwelling_id: dwelling_0.id,
      bedrooms: 2,
      baths: 3,
      occupant_min: 3,
      occupant_max: 4,
      mo_rent_min: 500,
      mo_rent_max: 800,
      sq_ft_min: 450,
      sq_ft_max: 520,
      dwelling_category_id: d_cat.id
})
floor_plan.save
floor_plan = FloorPlan.new({
      dwelling_id: dwelling_0.id,
      bedrooms: 6,
      baths: 3,
      occupant_min: 3,
      occupant_max: 8,
      mo_rent_min: 500,
      mo_rent_max: 800,
      sq_ft_min: 450,
      sq_ft_max: 520,
      dwelling_category_id: d_cat.id
})
floor_plan.save
address_2 = Address.new({
line_1: "262 Divisadero St",
city: "San Francisco",
state: "CA",
zipcode: 94117,
addressable_type: "Dwelling",
addressable_id: dwelling_11.id
})
address_2.save
floor_plan = FloorPlan.new({
      dwelling_id: dwelling_11.id,
      bedrooms: 2,
      baths: 1,
      occupant_min: 1,
      occupant_max: 2,
      mo_rent_min: 500,
      mo_rent_max: 800,
      sq_ft_min: 450,
      sq_ft_max: 520,
      dwelling_category_id: d_cat.id
})
floor_plan.save
floor_plan = FloorPlan.new({
      dwelling_id: dwelling_11.id,
      bedrooms: 2,
      baths: 3,
      occupant_min: 2,
      occupant_max: 4,
      mo_rent_min: 500,
      mo_rent_max: 800,
      sq_ft_min: 450,
      sq_ft_max: 520,
      dwelling_category_id: d_cat.id
})
floor_plan.save
address_3 = Address.new({
line_1: "2197 Fillmore St",
city: "San Francisco",
state: "CA",
zipcode: 94115,
addressable_type: "Dwelling",
addressable_id: dwelling_22.id
})
address_3.save
floor_plan = FloorPlan.new({
      dwelling_id: dwelling_22.id,
      bedrooms: 3,
      baths: 3,
      occupant_min: 4,
      occupant_max: 7,
      mo_rent_min: 500,
      mo_rent_max: 800,
      sq_ft_min: 450,
      sq_ft_max: 520,
      dwelling_category_id: d_cat.id
})
floor_plan.save
floor_plan = FloorPlan.new({
      dwelling_id: dwelling_22.id,
      bedrooms: 4,
      baths: 2,
      occupant_min: 4,
      occupant_max: 10,
      mo_rent_min: 500,
      mo_rent_max: 800,
      sq_ft_min: 450,
      sq_ft_max: 520,
      dwelling_category_id: d_cat.id
})
floor_plan.save
address_4= Address.new({
line_1: "7438 Mission St",
city: "Daly City",
state: "CA",
zipcode: 94014,
addressable_type: "Dwelling",
addressable_id: dwelling_33.id
})
address_4.save
floor_plan_2 = FloorPlan.new({
      dwelling_id: dwelling_33.id,
      bedrooms: 4,
      baths: 3,
      occupant_min: 2,
      occupant_max: 4,
      mo_rent_min: 600,
      mo_rent_max: 900,
      sq_ft_min: 550,
      sq_ft_max: 650,
      dwelling_category_id: d_cat.id
})
floor_plan_2.save

address_5= Address.new({
line_1: "49 Serramonte Center",
city: "Daly City",
state: "CA",
zipcode: 94015,
addressable_type: "Dwelling",
addressable_id: dwelling_44.id
})
address_5.save
floor_plan_2 = FloorPlan.new({
      dwelling_id: dwelling_44.id,
      bedrooms: 4,
      baths: 3,
      occupant_min: 2,
      occupant_max: 4,
      mo_rent_min: 600,
      mo_rent_max: 900,
      sq_ft_min: 550,
      sq_ft_max: 650,
      dwelling_category_id: d_cat.id
})
floor_plan_2.save

address_6 = Address.new({
line_1: "321 Gellert Blvd",
city: "Daly City",
state: "CA",
zipcode: 94015,
addressable_type: "Dwelling",
addressable_id: dwelling_55.id
})
address_6.save
floor_plan_2 = FloorPlan.new({
      dwelling_id: dwelling_55.id,
      bedrooms: 4,
      baths: 3,
      occupant_min: 2,
      occupant_max: 4,
      mo_rent_min: 600,
      mo_rent_max: 900,
      sq_ft_min: 550,
      sq_ft_max: 650,
      dwelling_category_id: d_cat.id
})
floor_plan_2.save

