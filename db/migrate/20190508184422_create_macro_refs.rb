class CreateMacroRefs < ActiveRecord::Migration[5.2]
  def change
    create_table :macro_refs do |t|
      t.references :utl_file, foreign_key: true, null: false
      t.integer :start, null: false
      t.integer :line
      t.text :text
      t.text :macro_name, null: false

      t.timestamps
    end
    # can't use utl_file_id, start alone as unique because, e.g.,
    # we have records like this:
    # start | line |               macro_name                | utl_file_id
    # ------+------+-----------------------------------------+-----------
    #  3179 |   72 | result.items                            | 10283
    #  3179 |   72 | result.items('type':'image')[0].preview | 10283
    # i.e. a macro call can return an object which can be part of another
    add_index :macro_refs, [:utl_file_id, :start, :macro_name], unique: true
  end
end
