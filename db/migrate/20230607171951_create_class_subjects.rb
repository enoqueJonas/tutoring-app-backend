class CreateClassSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :class_subjects do |t|
      t.string :subject
      t.string :description
      t.decimal :price
      t.integer :duration

      t.timestamps
    end
  end
end
