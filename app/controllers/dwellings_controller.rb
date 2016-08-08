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




@dwellings = Address.near(params[:location], 5).includes(dwelling: ASSOCIATED_OBJECTS)
							# .map {|address| address.addressable}
		# .where(floor_plans: [:bedrooms, :baths, :occupants])

		# @dwellings = Address.near(params[:location], 5)
		# 										.is_dwelling
		# 											.includes(addressable: [:floor_plans, :amenities, :dwelling_details])
		# 												.map {|address| address.addressable}
		# 										.searchable_filter(floor_plan_params, :floor_plans)
		# 													# .uniq
binding.pry
end
	# def dwellings_with_associations_preloaded
	# end
# 		@dwellings = @addresses.floor_plans.search_filter(floor_plan_params)

# Address.near(params[:location], 5)
# 	.includes(addressable: [:floor_plans, :amenities, :dwelling_details])
# 		.where(floor_plans: floor_plan_params)
# 			.map {|address| address.addressable}

# .where(:floor_plans => floor_plan_params, joins: floor_plans)
# @readings = Reading.includes(region: { stores: :manager }).where(
#   manager: { name: 'John Smith' },
#   region: { id: 1234567 })
# end
    # def searchable_filter(filtering_params)
    #   results = self.where(nil)
    #   filtering_params.each do |key, value|
    #     results = results.public_send(key, value) if value.present?
    #   end
    #   results

    # end

		# @dwellings = FloorPlan.search_filter(floor_plan_params)
														# .includes(dwelling: ASSOCIATED_OBJECTS)
		      										# .map {|floor_plan| floor_plan.dwelling }
		      											# .uniq
	# end
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