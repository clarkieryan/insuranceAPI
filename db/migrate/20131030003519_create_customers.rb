class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :title
      t.string :forename
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
