require 'rails_helper'

RSpec.describe Charge, type: :model do
  subject { build(:charge) }

  describe 'Associations' do
    it 'belongs to reservation' do
      association = described_class.reflect_on_association(:reservation)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a reservation' do
      subject.reservation = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a charge uid' do
      subject.charge_uid = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an amount' do
      subject.amount = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a currency' do
      subject.currency = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a status' do
      subject.status = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a receipt url' do
      subject.receipt_url = nil
      expect(subject).not_to be_valid
    end
  end
end
