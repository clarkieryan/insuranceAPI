class Quote < ActiveRecord::Base

  has_one :customer
  has_many :incidents

end
