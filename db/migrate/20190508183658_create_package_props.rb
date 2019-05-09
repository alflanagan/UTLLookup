class CreatePackageProps < ActiveRecord::Migration[5.2]
  def change
    create_table :package_props do |t|
      t.references :package, foreign_key: true, null: false
      t.string :key, null: false
      t.text :value

      t.timestamps
    end
  end
  add_index :package_props, [:package_id, :key], unique: true
end
