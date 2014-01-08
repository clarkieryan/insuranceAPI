class CustomerDetail < ActiveRecord::Base

  #Relations
  belongs_to :customer

  #Validation
  validates :dob, :street, :city, :county, :telNumber, :postCode, :licenceType, :licenceHeldSince, :occupation, presence: true

  #Ensure it only accpets Full or Provisional
  validates :licenceType, inclusion: { in: %w(full provisional), message: "%{value} is not acceptable. Should be either Full or Provisional" }
end
