class Chair < ActiveRecord::Base
  has_many :bookings
  belongs_to :office
end
