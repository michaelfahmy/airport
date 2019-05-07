require 'rails_helper'

RSpec.describe Passenger, type: :model do
  subject { build(:passenger) }

  describe 'Associations' do
    it 'belongs to a reservation' do
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

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a passenger type' do
      subject.passenger_type = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a passenger class' do
      subject.passenger_class = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a seat' do
      subject.seat = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a fee' do
      subject.fee = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with invalid seat' do
      subject.seat = 'some_invalid_seat'
      expect(subject).not_to be_valid
    end

    it 'is not valid with taken seat' do
      reservation = create(:reservation, flight: subject.flight)
      reservation.passengers << subject.dup
      expect(subject).not_to be_valid
    end
  end
end
