require 'rails_helper'

RSpec.describe Patient, :type => :model do

  it "has a valid factory" do
    build(:patient).should be_valid
  end

  it "is invalid without an email" do
    build(:patient, email: nil).should_not be_valid
  end

  it "is invalid without a password" do
    build(:patient, password: nil).should_not be_valid
  end

  it "is invalid without a birthday" do
    build(:patient, birthday: nil).should_not be_valid
  end

  it "is invalid without an age greater than 18 years" do

    build(:patient, birthday: "01/01/2009").should_not be_valid
  end

  it "is valid with an age greater than 18" do

    build(:patient, birthday: "09/01/1996").should be_valid
  end

end
