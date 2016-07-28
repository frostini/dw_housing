class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :preference_name
    end
  end
end
