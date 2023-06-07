class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.string :city
      t.references :user, null: false, foreign_key: true
      t.references :classSubject, null: false, foreign_key: true
      t.timestamp :start

      t.timestamps
    end
  end
end
