class CreatePriorities < ActiveRecord::Migration[5.1]
  def self.up
    create_table :priorities do |t|
      t.string :name
      t.string :label
      t.integer :value

      t.timestamps
    end
  end
  def self.down
    drop_table :priorities
  end
end
