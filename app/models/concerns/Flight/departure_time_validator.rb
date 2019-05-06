class Flight::DepartureTimeValidator < ActiveModel::Validator
  def validate(record)
    return unless record.departure_time

    record.errors.add(:departure_time, 'cannot be in the past!') if record.departure_time < Time.current
  end
end
