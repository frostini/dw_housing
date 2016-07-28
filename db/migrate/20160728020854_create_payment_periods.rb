class CreatePaymentPeriods < ActiveRecord::Migration
  def change
    create_table :payment_periods do |t|
    	t.string :payment_period_type
    	t.timestamps
    end
  end
end
