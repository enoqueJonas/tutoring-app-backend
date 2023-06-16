class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :classSubject
  validates :date, :city, :user, :classSubject, presence: true
end
