class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :applications, :name, unique: true
  end
end
