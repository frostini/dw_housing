class DwellingsController < ApplicationController
before_action :authenticate_user!, only: [:edit, :new]
before_action :set_dwelling_context, only: [:edit, :show]

ASSOCIATED_OBJECTS = [:address, :floor_plans, 
											:amenities, :dwelling_details]
	def index
		@dwellings = Dwelling.includes(:address)
	end
	def show
	end
	def new
	end
	def edit
	end
	def search
		# binding.pry
		addresses_within_range = Address.near(params[:location], params[:search_proximity]).where(addressable_type: "Dwelling")
		matching_floor_plans = FloorPlan.search_filter(floor_plan_params).select(:dwelling_id, :id)
		address_ids, floor_plan_ids = [], []
		addresses_within_range.map {|x| address_ids << x.addressable_id}
		matching_floor_plans.map { |x| floor_plan_ids << x.dwelling_id}
		filtered_dwelling_ids = address_ids & floor_plan_ids
		@dwellings = Dwelling.includes(ASSOCIATED_OBJECTS).where('id IN (?)', filtered_dwelling_ids)
	end

private
	def floor_plan_params
		params.slice(:bedrooms, :baths, :occupants, :mo_rent_price)
	end
	def sanitize_values
	end
	def set_dwelling_context
		id = get_dwelling_id
		@dwelling =  Dwelling.includes(ASSOCIATED_OBJECTS)
									.find_by_id(id)
		catch_not_found(id) unless @dwelling
	end
	def get_dwelling_id
		 id = params[:id].to_i > 0 ? params[:id].to_i : params[:id]
	end
	def catch_not_found(record_id)
		  flash[:error] = "Dwelling with ID ##{record_id} does not exist."
		  redirect_to dwellings_path and return
	end
end