require 'rails_helper'

RSpec.describe Flight, type: :model do
  let(:airplane) { Airplane.new(model: 'Airbus 777') }

  subject do
    described_class.new(airplane: airplane,
                        number: 127,
                        departure_airport: 'CAI',
                        destination_airport: 'DXB',
                        departure_time: Time.current.tomorrow,
                        arrival_time: Time.current.tomorrow + 6.hours)
  end

  describe 'Associations' do
    it 'belongs to an Airplane' do
      association = described_class.reflect_on_association(:airplane)
      expect(association.macro).to eq :belongs_to
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
  end
end
