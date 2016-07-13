class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:new]
	before_action :validate_user, only: [:show, :edit]
  before_action :set_current_user, only: [:show, :edit, :index]
  before_action :validate_admin, only: [:index]

	def index
	end
	
	def show
	end
	
	def new
	end
	
	def edit
	end

private
  
  def validate_user
    unless current_user and current_user.id.to_s === params[:id]
    	redirect_to user_path(current_user.id) 
    	flash[:notice] = "Other user profiles are private"
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