class CreateTimezones < ActiveRecord::Migration[5.1]
  def self.up
    create_table :timezones do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end
  def self.down
    drop_table :timezones
  end
end
