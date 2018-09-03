class CreateProjects < ActiveRecord::Migration[5.1]
  def self.up
    create_table :projects do |t|
      t.references :region, foreign_key: true
      t.references :client, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
  def self.down
    drop_table :projects
  end
end
