class Passenger::SeatValidator < ActiveModel::Validator
  def validate(record)
    return unless record.flight

    # pp record.flight.available_seats.include?(record.seat) ? 'Available' : 'Not'
    record.errors.add(:seat, 'is not available!') unless record.flight.available_seats.include?(record.seat)
  end
end
