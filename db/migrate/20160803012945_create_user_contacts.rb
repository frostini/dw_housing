class CreateUserContacts < ActiveRecord::Migration
  def change
    create_table :user_contacts do |t|
      t.string	:value
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :contact, index: true, foreign_key: true
    end
  end
end
