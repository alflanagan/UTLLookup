class CreateTownnewsSiteMetaData < ActiveRecord::Migration[5.2]
  def change
    create_table :townnews_site_meta_data do |t|
      t.references :townnews_site, foreign_key: true, null: false
      t.string :pkg_name, null: false
      t.text :zip_name
      t.string :version, null: false
      t.boolean :is_certified, null: false
      t.datetime :last_download, null: false

      t.timestamps
    end
    # true primary key
    add_index :townnews_site_meta_data,
              [:townnews_site_id,
               :pkg_name,
               :version,
               :last_download], unique: true, name: 'index_tnsmd_primary_key'
  end
end
