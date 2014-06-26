class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :date_of_birth, :email, :first_name, :last_name, :phone

  has_many :appointments
  has_many :appointment_requests


  def check_date_of_birth(params_date_of_birth)
    if self.date_of_birth == params_date_of_birth
      return true
    else
      return false
    end
  end

end
