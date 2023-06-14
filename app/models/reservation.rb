class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :class_subject

end
