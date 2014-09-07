class Patient < ActiveRecord::Base

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :appointments

  # Validations
  validate :old_enough
  validate :possible_age
  validates_format_of :birthday, with: /\d{2}\/\d{2}\/\d{4}/, message: "Birthday must be in mm/dd/YYYY format."
  validates :email, uniqueness: true
  validates :email, :email => {:strict_mode => true}



  def old_enough
    minimum_age = Date.today - 18.years
    birthday = self.birthday
    birth_date = case birthday

    when String then Date.strptime(birthday, '%m/%d/%Y')
    when Date then birthday
    else raise "Unable to parse date, must be Date or String of format '%m/%d/%Y'"
    end

    if birth_date > minimum_age
      errors.add(:birthday, 'Patient must be older than 18 years old to schedule an appointment online.')
    end

  end

  def possible_age
    maximum_age = Date.today - 100.years.ago
    birthday = self.birthday
    birth_date = case birthday

    when String then Date.strptime(birthday, '%m/%d/%Y')
    when Date then birthday
    else raise "Unable to parse date, must be Date or String of format '%m/%d/%Y'"
    end

    if birth_date > maximum_age
      errors.add(:birthday, 'Patient must younger than 100 years old to schedule an appointment online.')
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

  def format_birthday(birthday)
   birthday.to_date.strftime('%m/%d/%Y')
  end

end
