class CreateGroups < ActiveRecord::Migration[5.1]
  def self.up
    create_table :groups do |t|
      t.references :region, foreign_key: true
      t.references :client, foreign_key: true
      t.references :dim_desk, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
  def self.down
    drop_table :groups
  end
end
