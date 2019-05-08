require 'rails_helper'

RSpec.describe Flight, type: :model do
  subject { build(:flight) }

  describe 'Associations' do
    it 'belongs to an Airplane' do
      association = described_class.reflect_on_association(:airplane)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many reservations' do
      association = described_class.reflect_on_association(:reservations)
      expect(association.macro).to eq :has_many
    end

    it 'has many passengers' do
      association = described_class.reflect_on_association(:passengers)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an airplane' do
      subject.airplane = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a number' do
      subject.number = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a departure airport' do
      subject.departure_airport = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a destination airport' do
      subject.destination_airport = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with invalid departure airport' do
      subject.departure_airport = 'some_invalid_iata_code'
      expect(subject).not_to be_valid
    end

    it 'is not valid with invalid destination airport' do
      subject.destination_airport = 'some_invalid_iata_code'
      expect(subject).not_to be_valid
    end

    it 'is not valid without a departure time' do
      subject.departure_time = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an arrival time' do
      subject.arrival_time = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a departure time in the past' do
      subject.departure_time = 2.days.ago
      expect(subject).not_to be_valid
    end

    it 'is not valid with an arrival time in the past' do
      subject.arrival_time = 2.days.ago
      expect(subject).not_to be_valid
    end

    it 'is not valid with an arrival time before departure time' do
      subject.arrival_time = subject.departure_time - 2.hours
      expect(subject).not_to be_valid
    end

    it 'is not valid with airplane has overlapping flight' do
      subject.airplane.flights << subject.dup
      expect(subject).not_to be_valid
    end

    it 'is not valid without adult fee' do
      subject.adult_fee = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without child fee' do
      subject.child_fee = nil
      expect(subject).not_to be_valid
    end
  end

  describe '#available_seats' do
    it 'returns array of available seats only' do
      r = create(:reservation, flight: subject)
      create(:passenger, reservation: r, seat: '1A')
      expect(subject.available_seats).not_to include '1A'
    end
  end
end
