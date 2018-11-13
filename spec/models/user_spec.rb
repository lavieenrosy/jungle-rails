require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Validations' do
    subject {
      described_class.new(first_name: "Hermione", last_name: "Granger", password: "12345", password_confirmation: "12345", email: "test@test.test")
    }
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'has a valid first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it 'has a valid last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it 'has a valid email name' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'has a valid password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'has a matching password and password confirmation' do
      subject.password = "hello"
      subject.password_confirmation = "hello"
      expect(subject).to be_valid
    end
    it 'must have a unique email' do
      @user = User.new(first_name: "Ron", last_name: "Weasley", password_digest: "12345", email: "TEST@TEST.TEST")
      @user.save!
      expect(subject).to_not be_valid
    end
    it 'must have a password with a min length of 5' do
      @user = User.new(first_name: "Ron", last_name: "Weasley", password_digest: "four", email: "TEST@TEST.TEST")
      expect(@user).to_not be_valid
    end
  end

  context '.authenticate_with_credentials' do
    it 'returns the user if the user already exists and the password is valid' do
      user = User.new(first_name: "Ron", last_name: "Weasley", password: "12345", password_confirmation: "12345", email: "ron@ron.ron")
      user.save!
      result = described_class.authenticate_with_credentials("ron@ron.ron", "12345")
      expect(result).to eql(user)
    end
  end


end

