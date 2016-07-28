class CreateHouseholdExpenses < ActiveRecord::Migration
  def change
    create_table :household_expenses do |t|
      t.belongs_to :user, index: true
      t.string :expense_kind
      t.string :entity
      t.string :frequency
      t.float :amount
      t.timestamps
    end
  end
end
