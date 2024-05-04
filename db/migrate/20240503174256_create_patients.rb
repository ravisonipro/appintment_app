class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.string :gender
      t.text :medical_conditions
      t.string :mobile_number
      t.string :address

      t.timestamps
    end
  end
end
