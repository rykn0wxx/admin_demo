class CreateTicketSlas < ActiveRecord::Migration[5.1]
  def self.up
    create_table :ticket_slas do |t|
      t.references :service_level, foreign_key: true
      t.references :ticket_type, foreign_key: true
      t.references :contact_type, foreign_key: true
      t.references :priority, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :actual_duration, :default => 0
      t.integer :business_duration, :default => 0
      t.integer :actual_pause, :default => 0
      t.integer :business_pause, :default => 0
      t.string :sla_stage
      t.string :location_city
      t.string :location_zip
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
  def self.down
    drop_table :ticket_slas
  end
end
