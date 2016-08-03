class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:new]
	before_action :validate_user_page_view_access, only: [:show, :edit]
  before_action :set_current_user, only: [:show, :edit, :index]
  before_action :validate_admin, only: [:index]
  before_action :set_user_context, only: [:show, :edit]
# 
ASSOCIATED_OBJECTS =  [:addresses, :gender, :ethnicity, 
                      :income_sources => [:payment_period, :income_source_category],
                      :household_members => [{:income_sources =>
                      [:payment_period, :income_source_category]}, 
                      :household_relationship, :gender, :ethnicity]] 
                      


	def index
    @users = User.all.includes(:addresses, :household_members)
	end
	
	def show
    
	end
	
	def new
	end
	
	def edit
	end

private
  # def set_user_context
  
  def set_user_context
    id = get_user_id
    @user =  User.includes(ASSOCIATED_OBJECTS)
                  .find_by_id(id)
    catch_not_found(id) unless @user
  end
  def get_user_id
     id = params[:id].to_i > 0 ? params[:id].to_i : params[:id]
  end
  def catch_not_found(record_id)
      flash[:error] = "User with ID ##{record_id} does not exist."
      redirect_to root_path and return
  end
  def validate_user_page_view_access
      unless current_user.admin == true
        unless current_user and current_user.id.to_s === params[:id] 
        	redirect_to user_path(current_user.id) 
        	flash[:notice] = "Other user profiles are private"
      end
    end
  end
  def validate_admin
		unless current_user and current_user.admin === true
  	  redirect_to root_path 
  	  flash[:notice] = "You do not have access to this page."
  	 end
  end
  def set_current_user
    @current_user = User.find(current_user.id)
  end


end