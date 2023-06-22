class RemoveStartFromRservationsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :start
  end
end
