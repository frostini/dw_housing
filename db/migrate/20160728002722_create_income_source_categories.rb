class CreateIncomeSourceCategories < ActiveRecord::Migration
  def change
    create_table :income_source_categories do |t|
      t.string :inc_cat_name
      t.string :inc_cat_description
      t.timestamps
    end
  end
end
