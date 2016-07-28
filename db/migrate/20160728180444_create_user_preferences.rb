class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :preference, index: true, foreign_key: true
    end
  end
end
