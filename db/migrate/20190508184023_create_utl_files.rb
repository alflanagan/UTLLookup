class CreateUtlFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :utl_files do |t|
      t.text :file_path, null: false
      t.references :package, foreign_key: true
      t.text :file_text

      t.timestamps
    end
    add_index :utl_files, [:package_id, :file_path], unique: true
  end
end
