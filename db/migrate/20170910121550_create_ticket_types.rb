class CreateTicketTypes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :ticket_types do |t|
      t.string :name
      t.string :label
      t.string :code

      t.timestamps
    end
  end
  def self.down
    drop_table :ticket_types
  end
end
