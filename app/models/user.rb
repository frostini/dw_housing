class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	APPLICANT				= "User::Applicant"
	VISITOR					= "User::Visitor"

  self.inheritance_column = 'user_type'

  # has_many :addresses, :as => :addressable

   # has_one :photo, :as => :attachable, :dependent => :destroy
   # has_one :secondary_photo, -> { where attachable_type: "SecondaryPhoto"},
   #   class_name: Photo, foreign_key: :attachable_id,
   #   foreign_type: :attachable_type, dependent: :destroy

  has_many :addresses, :as => :addressable, through: :user_addresses
  has_many :user_addresses

  has_many :household_members
belongs_to :gender
belongs_to :ethnicity

  has_many :preferences, through: :user_preferences
  has_many :user_preferences

  has_many :income_sources, :as => :incomeable
  
  has_many :household_expenses

  has_many :income_source_categories, through: :user_income_source_categories
  has_many :user_income_source_categories

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
