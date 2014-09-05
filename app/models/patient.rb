class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments

  #validations
  validates :email, uniqueness: true
  validates :email, format: {with: /\S{3,}@\S{3,}\.\S{2,}/}

  def check_birthday(params_birthday)
    if self.birthday == params_birthday
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
