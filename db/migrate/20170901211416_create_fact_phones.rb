class CreateFactPhones < ActiveRecord::Migration[5.1]
  def self.up
    create_table :fact_phones do |t|
      t.references :dim_time, foreign_key: true
      t.references :project, foreign_key: true
      t.references :language, foreign_key: true
      t.references :timezone, foreign_key: true
      t.datetime :record_date
      t.integer :calls_off, default: 0, null: false
      t.integer :calls_ans, default: 0, null: false
      t.integer :calls_wsl, default: 0, null: false
      t.integer :calls_abn, default: 0, null: false
      t.integer :calls_a30, default: 0, null: false
      t.integer :time_talk, default: 0, null: false
      t.integer :time_hold, default: 0, null: false
      t.integer :time_wrap, default: 0, null: false
      t.integer :queue_ans, default: 0, null: false
      t.integer :queue_max, default: 0, null: false

      t.timestamps
    end
  end
  def self.down
    drop_table :fact_phones
  end
end
