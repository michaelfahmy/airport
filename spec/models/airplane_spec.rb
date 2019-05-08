require 'rails_helper'

RSpec.describe Airplane, type: :model do
  subject { build(:airplane) }

  describe 'Associations' do
    it 'has many flights' do
      association = described_class.reflect_on_association(:flights)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without model' do
      subject.model = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without business class rows' do
      subject.business_class_rows = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without economy class rows' do
      subject.economy_class_rows = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without seats per row' do
      subject.seats_per_row = nil
      expect(subject).not_to be_valid
    end
  end

  describe '#seats' do
    it 'returns array of seat numbers' do
      seats = subject.seats
      expect(seats[0]).to eq '1A'
      expect(seats.size).to eq((subject.business_class_rows + subject.economy_class_rows) * subject.seats_per_row)
    end
  end
end
