class CreateMacroDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :macro_definitions do |t|
      t.references :utl_file, foreign_key: true, null: false
      t.text :text
      t.string :name, index: true, null: false
      t.integer :start, null: false
      t.integer :end
      t.integer :line

      t.timestamps
    end
    add_index :macro_definitions, [:utl_file_id, :start], unique: true
  end
end
