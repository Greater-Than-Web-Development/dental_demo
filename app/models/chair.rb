class Chair < ActiveRecord::Base
  has_many :appointments
  belongs_to :office
end
