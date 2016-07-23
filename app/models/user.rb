class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	APPLICANT				= "User::Applicant"
	VISITOR					= "User::Visitor"

self.inheritance_column = 'user_type'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.user_types
    ["applicant" => APPLICANT, "visitor" => VISITOR]
  end

  def self.user_form_selections
    user_types.map{|h| [h.keys.map(&:titleize), h.values]}.flatten(1).transpose
  end

  def applicant?
  	user_type == APPLICANT
  end
  
  def visitor?
  	user_type == VISITOR
  end


private

  def user_params
    params.require(:user).permit(:user_type, :email, :password, :password_confirmation)
  end

end
