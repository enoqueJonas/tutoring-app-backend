class AddUserToClassSubjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :class_subjects, :user, foreign_key: { unique: true }
  end
end
