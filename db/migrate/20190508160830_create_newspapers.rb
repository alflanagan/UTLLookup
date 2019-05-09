class CreateNewspapers < ActiveRecord::Migration[5.2]
  def change
    create_table :newspapers do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :newspapers, :name, unique: true
  end
end
