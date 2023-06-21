class ClassSubject < ApplicationRecord
  has_many :reservations, foreign_key: 'classSubject_id', dependent: :destroy
end
