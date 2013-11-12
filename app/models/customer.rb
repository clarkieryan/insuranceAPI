class Customer < ActiveRecord::Base
  #Adding in some validation

  has_one :customer_detail

  #Email is unique so need to make sure this is true when adding a new customer
  validates :email, uniqueness: { case_sensitive: false }

end

