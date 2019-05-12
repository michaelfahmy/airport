require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject { build(:reservation) }

  describe 'Associations' do
    it 'belongs to flight' do
      t = described_class.reflect_on_association(:flight)
      expect(t.macro).to eq :belongs_to
    end

    it 'belongs to user' do
      t = described_class.reflect_on_association(:user)
      expect(t.macro).to eq :belongs_to
    end

    it 'has many passengers' do
      t = described_class.reflect_on_association(:passengers)
      expect(t.macro).to eq :has_many
    end
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a flight' do
      subject.flight = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a repeated confirmation number' do
      create(:reservation, confirmation_number: 'A1B1C1')
      subject.confirmation_number = 'A1B1C1'
      expect(subject).not_to be_valid
    end
  end
end
