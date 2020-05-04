class Passenger::SeatValidator < ActiveModel::Validator
  def validate(record)
    return unless record.flight

    record.errors.add(:seat, 'is not available!') unless record.flight.available_seats.include?(record.seat)
  end
end
