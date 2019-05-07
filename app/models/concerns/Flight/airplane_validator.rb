class Flight::AirplaneValidator < ActiveModel::Validator
  def validate(record)
    return unless record.airplane && record.departure_time && record.arrival_time

    record.airplane.flights.each do |f|
      if (record.departure_time..record.arrival_time).overlaps?(f.departure_time..f.arrival_time)
        record.errors.add(:airplane, 'has another flight overlaps with this flight!')
        break
      end
    end
  end
end
