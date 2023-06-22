require 'rails_helper'

RSpec.describe ClassSubject, type: :model do
  it 'has many reservations' do
    class_subject = ClassSubject.new
    expect(class_subject.reservations).to be_empty

    reservation = Reservation.new
    class_subject.reservations << reservation

    expect(class_subject.reservations).to include(reservation)
  end

  it 'destroys associated reservations when destroyed' do
    class_subject = ClassSubject.new
    reservation = Reservation.new
    class_subject.reservations << reservation
  end
end
