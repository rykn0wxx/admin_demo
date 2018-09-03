class CreateClients < ActiveRecord::Migration[5.1]
  def self.up
    create_table :clients do |t|
      t.string :name

      t.timestamps
    end
  end
  def self.down
    drop_table :clients
  end
end
