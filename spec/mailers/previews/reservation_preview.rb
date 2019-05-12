class ReservationPreview < ActionMailer::Preview
  def reservation_confirmed
    ReservationMailer.reservation_confirmed(Reservation.all.sample)
  end
end
