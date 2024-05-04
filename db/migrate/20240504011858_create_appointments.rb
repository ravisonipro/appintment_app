class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.time :appointment_time
      t.string :appointment_type
      t.references :doctor, foreign_key: { to_table: :users }
      t.references :patient, foreign_key: true
      t.references :receptionist, foreign_key: { to_table: :users }
      t.string :symptoms

      t.timestamps
    end
  end
end
