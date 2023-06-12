class AddTutorNameToClassSubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :class_subjects, :tutorName, :string
  end
end
