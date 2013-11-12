class CreateQuoteDetails < ActiveRecord::Migration
  def change
    create_table :quote_details do |t|
      t.integer :customer_id
      t.integer :incidents_id
      t.string :vehicleReg
      t.string :estimatedMileage
      t.string :estimatedVehicleValue
      t.string :parkingLocation
      t.integer :policyExcess
      t.integer :breakdownCover
      t.integer :windscreenCover

      t.timestamps
    end
  end
end
