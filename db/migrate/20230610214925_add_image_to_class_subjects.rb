class AddImageToClassSubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :class_subjects, :image, :string
  end
end
