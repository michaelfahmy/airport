require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject { build(:reservation) }

  describe 'Associations' do
    it 'belongs to Flight' do
      t = described_class.reflect_on_association(:flight)
      expect(t.macro).to eq :belongs_to
    end

    it 'belongs to User' do
      t = described_class.reflect_on_association(:user)
      expect(t.macro).to eq :belongs_to
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
  end
end
