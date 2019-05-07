require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'Associations' do
    it 'has many reservations' do
      association = described_class.reflect_on_association(:reservations)
      expect(association.macro).to eq :has_many
    end
  end

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
