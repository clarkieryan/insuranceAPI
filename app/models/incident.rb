class Incident < ActiveRecord::Base

  has_one :quote

  #Resolves type issue
  self.inheritance_column = nil
end
