class CreateDimTimes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :dim_times do |t|
      t.decimal :dt_num
      t.time :dt_time

      t.timestamps
    end
  end
  def self.down
    drop_table :dim_times
  end
end
