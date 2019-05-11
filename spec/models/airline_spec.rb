require 'rails_helper'

RSpec.describe Airline, type: :model do
  subject { build(:airline) }

  describe 'Associations' do
    it 'has many airplanes' do
      association = described_class.reflect_on_association(:airplanes)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without currency' do
      subject.currency = nil
      expect(subject).not_to be_valid
    end
  end
end
