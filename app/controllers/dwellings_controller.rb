class DwellingsController < ApplicationController
before_action :authenticate_user!, only: [:edit, :new]
before_action :set_dwelling_context, only: [:edit, :show]

ASSOCIATED_OBJECTS = [:address, :floor_plans, 
											:amenities, :dwelling_details]

	def index
		@dwellings = Dwelling.all.includes(ASSOCIATED_OBJECTS)
	end
	def show
	end
	def new
	end
	def edit
	end
	def search
		# @dwellings = nil
		# params[:location]
		@addreses = Address.near(params[:location], 5)
		@dwellings = FloorPlan.search_filter(floor_plan_params)
														.includes(dwelling: ASSOCIATED_OBJECTS)
		      										.map {|floor_plan| floor_plan.dwelling }
		      											.uniq
binding.pry
	end
private
	def floor_plan_params
		params.slice(:bedrooms, :baths, :occupants)
	end
	def sanitize_values()
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