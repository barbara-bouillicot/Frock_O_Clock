class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.float :price
      t.float :total
      t.references :user, null: false, foreign_key: true
      t.references :costume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
