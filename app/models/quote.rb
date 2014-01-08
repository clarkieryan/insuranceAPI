class Quote < ActiveRecord::Base

  has_one :customer
  has_many :incidents

  validates :vehicleReg, :estimatedMileage, :estimatedVehicleValue, :parkingLocation, :policyExcess, presence: true

  validates_presence_of :breakdownType, :if => :breakdownCover?
  validates_presence_of :windscreenExcess, :if => :windscreenCover?

end
