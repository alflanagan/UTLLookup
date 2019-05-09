class CreatePackageDeps < ActiveRecord::Migration[5.2]
  def change
    create_table :package_deps do |t|
      t.references :package, foreign_key: true, null: false
      t.string :dep_name, index: true
      t.integer :dep_pkg, null: false, index: true
      t.string :dep_version

      t.timestamps
    end
    # uniqueness constraint again complex:
    # [pkg, dep_pkg] if !dep_pkg.nil?
    # [pkg, dep_name, dep_version] if dep_pkg.nil?
  end
end
