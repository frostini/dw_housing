class CreateHouseholdMembers < ActiveRecord::Migration
  def change
    create_table :household_members do |t|
      t.belongs_to :user, index: true
      t.belongs_to :household_relationship, index: true
      t.belongs_to :gender, index: true
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :ethnicity
      t.timestamps
    end
  end
end
