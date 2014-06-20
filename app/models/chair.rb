class Chair < ActiveRecord::Base
  attr_accessible :name

  has_many :appointments
end
