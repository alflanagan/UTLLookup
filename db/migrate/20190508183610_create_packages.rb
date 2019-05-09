class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name, null: false
      t.string :version, index: true
      t.boolean :is_certified
      t.references :application, foreign_key: true
      t.datetime :last_download, index: true
      t.text :disk_directory
      t.references :townnews_site, foreign_key: true
      t.string :pkg_type, null: false

      t.timestamps
    end
  # unique constraints on packages too complex to define here
  # certified packages: [:name, :version]
  # custom packages: [:townnews_site_id, :name, :last_download]
  end
end
