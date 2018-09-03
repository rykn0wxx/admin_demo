class CreateDimDesks < ActiveRecord::Migration[5.1]
  def self.up
    create_table :dim_desks do |t|
      t.string :name
      t.string :label
      t.integer :support_level

      t.timestamps
    end
  end
  def self.down
    drop_table :dim_desks
  end
end
