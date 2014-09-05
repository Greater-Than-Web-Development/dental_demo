class Patient < ActiveRecord::Base

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :appointments

  # Validations
  validate :old_enough
  validates :email, uniqueness: true
  validates :email, :email => {:strict_mode => true}
  # validates :email, format: {with: /\S{3,}@\S{3,}\.\S{2,}/}

  def old_enough
    minimum_age = Date.today - 18.years
    birth_date = Date.strptime(self.birthday, '%m/%d/%Y')

    if birth_date > minimum_age
      errors.add(:birthday, 'Patient must be older than 18 years old to schedule an appointment online.')
    end
  end

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
