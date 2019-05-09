class CreateTownnewsSites < ActiveRecord::Migration[5.2]
  def change
    create_table :townnews_sites do |t|
      t.string :URL, null: false
      t.string :name
      t.references :newspaper, foreign_key: true

      t.timestamps
    end
    add_index :townnews_sites, :URL, unique: true
  end
end
