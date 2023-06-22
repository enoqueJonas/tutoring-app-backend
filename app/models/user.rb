class User < ApplicationRecord
  has_many :reservations
  validates :name, :email, presence: true
end
