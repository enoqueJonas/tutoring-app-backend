require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it "is valid with a date, city, user, and class subject" do
    user = User.new(name: "John Doe", email: "john@example.com")
    class_subject = ClassSubject.new

    reservation = Reservation.new(date: Date.today, city: "New York", user: user, classSubject: class_subject)
    expect(reservation).to be_valid
  end

  it "is invalid without a date" do
    reservation = Reservation.new(city: "New York")
    expect(reservation).to be_invalid
    expect(reservation.errors[:date]).to include("can't be blank")
  end

  it "is invalid without a city" do
    reservation = Reservation.new(date: Date.today)
    expect(reservation).to be_invalid
    expect(reservation.errors[:city]).to include("can't be blank")
  end

  it "is invalid without a user" do
    reservation = Reservation.new(date: Date.today, city: "New York")
    expect(reservation).to be_invalid
    expect(reservation.errors[:user]).to include("can't be blank")
  end

  it "is invalid without a class subject" do
    reservation = Reservation.new(date: Date.today, city: "New York", user: User.new(name: "John Doe", email: "john@example.com"))
    expect(reservation).to be_invalid
    expect(reservation.errors[:classSubject]).to include("can't be blank")
  end

  it "belongs to a user" do
    user = User.new(name: "John Doe", email: "john@example.com")
    reservation = Reservation.new(date: Date.today, city: "New York", user: user)

    expect(reservation.user).to eq(user)
  end

  it "belongs to a class subject" do
    class_subject = ClassSubject.new
    reservation = Reservation.new(date: Date.today, city: "New York", classSubject: class_subject)

    expect(reservation.classSubject).to eq(class_subject)
  end
end
