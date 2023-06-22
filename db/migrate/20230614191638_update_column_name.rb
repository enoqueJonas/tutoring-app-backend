class UpdateColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :class_subject_id, :classSubject_id
  end
end
