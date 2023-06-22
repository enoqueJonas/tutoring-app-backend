require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name and email" do
    user = User.new(name: "John Doe", email: "john@example.com")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(email: "john@example.com")
    expect(user).to be_invalid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(name: "John Doe")
    expect(user).to be_invalid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "has many reservations" do
    user = User.new(name: "John Doe", email: "john@example.com")
    expect(user.reservations).to be_empty

    reservation = Reservation.new
    user.reservations << reservation

    expect(user.reservations).to include(reservation)
  end
end
