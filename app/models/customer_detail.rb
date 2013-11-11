class CustomerDetail < ActiveRecord::Base

  #Ensure incidents are valid
  #Ensure Quote Refs are valid
  belongs_to :customer


end
