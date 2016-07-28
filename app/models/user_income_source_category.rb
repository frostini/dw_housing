class UserIncomeSourceCategory < ActiveRecord::Base
belongs_to :user
belongs_to :income_source_category
end