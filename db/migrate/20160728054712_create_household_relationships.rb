class CreateHouseholdRelationships < ActiveRecord::Migration
  def change
    create_table :household_relationships do |t|
      t.string :relation_title
    end
  end
end
