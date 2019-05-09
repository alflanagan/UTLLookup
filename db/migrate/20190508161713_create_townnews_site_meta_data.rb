class CreateTownnewsSiteMetaData < ActiveRecord::Migration[5.2]
  def change
    create_table :townnews_site_meta_data do |t|
      t.references :townnews_site, foreign_key: true
      t.string :pkg_name
      t.text :zip_name
      t.string :version
      t.boolean :is_certified
      t.datetime :last_download

      t.timestamps
    end
  end
  # true primary key
  add_index :townnews_site_meta_data, [:townnews_id,
                                       :pkg_name,
                                       :version,
                                       :last_download], unique: true
end
