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

end
