class CreateCustomerDetails < ActiveRecord::Migration
  def change
    create_table :customer_details do |t|
      t.belongs_to :customer
      t.integer :dob
      t.integer :telNumber
      t.string :street
      t.string :city
      t.string :county
      t.string :postCode
      t.string :licenceType
      t.string :licenceHeldSince
      t.string :occupation
      t.integer :quotesStored
      t.integer :incidents

      t.timestamps
    end
  end
end
