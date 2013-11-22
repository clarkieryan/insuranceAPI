class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.belongs_to :customer_id

      t.integer :incident_id
      t.string :vehicleReg
      t.integer :estimatedMileage
      t.integer :estimatedVehicleValue
      t.string :parkingLocation
      t.integer :policyExcess
      t.boolean :breakdownCover
      t.boolean :windscreenCover

      t.timestamps
    end
  end
end
