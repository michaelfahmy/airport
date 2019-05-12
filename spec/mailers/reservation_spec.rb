require 'rails_helper'

RSpec.describe ReservationMailer, type: :mailer do
  describe 'reservation_confirmed' do
    let(:reservation) { create(:reservation) }
    let(:mail) { ReservationMailer.reservation_confirmed(reservation) }

    it 'renders the headers' do
      create(:charge, reservation: reservation)
      expect(mail.subject).to eq('Reservation confirmed')
      expect(mail.to).to eq([reservation.user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      create(:charge, reservation: reservation)
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
