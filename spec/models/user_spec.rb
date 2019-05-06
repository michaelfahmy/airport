require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(password: 'password', email: 'john@doe.com') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a role' do
      subject.role = nil
      expect(subject).not_to be_valid
    end
  end
end
