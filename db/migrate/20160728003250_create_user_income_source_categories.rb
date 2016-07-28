class CreateUserIncomeSourceCategories < ActiveRecord::Migration
  def change
    create_table :user_income_source_categories do |t|
      t.belongs_to :user, index: true 
      t.belongs_to :income_source_category, index: {:name => "index_usr_inc_source_cat_on_inc_source_cat_id"}
      t.timestamps
    end
  end
end
