class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :date_of_birth, :email, :first_name, :last_name, :phone, :email, :password, :password_confirmation, :remember_me

  has_many :appointments
  has_many :appointment_requests

  #Validations
  validates_date :date_of_birth, :before => lambda { 18.years.ago },
                               :before_message => "must be at least 18 years old"

  validates :email, uniqueness: true
  validates :email, format: {with: /\S{3,}@\S{3,}\.\S{2,}/}


  def check_date_of_birth(params_date_of_birth)
    if self.date_of_birth == params_date_of_birth
      return true
    else
      return false
    end
  end

  def check_email(params_email)
    if self.email == params_email
      return true
    else
      return false
    end
  end

end
