class ReservationMailer < ApplicationMailer
  include ApplicationHelper
  helper :application

  def reservation_confirmed(reservation)
    @user = reservation.user
    @reservation = reservation

    email_with_name = %("#{full_name(@user)}" <#{@user.email}>)
    mail to: email_with_name, subject: 'Reservation confirmed'
  end
end
