class CreateIncomeSources < ActiveRecord::Migration
  def change
    create_table :income_sources do |t|
      t.references :payment_period, index: true
      t.string :source
      t.float :amount_per_payment
      t.string :source_proof_details
      t.references :incomeable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
