class Customer < ActiveRecord::Base
  #Relations
  has_one :customer_detail
  has_many :quotes

  #Validation
  validates :title, presence: true
  #Email is unique so need to make sure this is true when adding a new customer
  #Also ensure email is in the correct format
  validates :email, uniqueness: { case_sensitive: false }, :email => true, presence: true
  validates :forename, presence: true
  validates :surname, presence: true


end

