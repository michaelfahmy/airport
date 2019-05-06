class Flight::ArrivalTimeValidator < ActiveModel::Validator
  def validate(record)
    return unless record.departure_time && record.arrival_time

    record.errors.add(:arrival_time, 'cannot be in the past or before Departure time!') if record.arrival_time < record.departure_time
  end
end
