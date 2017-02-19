class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :customer_name
      t.integer :customer_age
      t.date :appointment_date
      t.string :time_slot
      t.integer :salon_id

      t.timestamps
    end
  end
end
