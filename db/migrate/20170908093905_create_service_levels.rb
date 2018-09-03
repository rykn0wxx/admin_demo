class CreateServiceLevels < ActiveRecord::Migration[5.1]
  def self.up
    create_table :service_levels do |t|
      t.references :dim_desk, foreign_key: true
      t.string :name
      t.text :description, null: false, default: ""
      t.text :definition, null: false, default: ""
      t.float :weighting, default: 0
      t.text :measurement, default: ""
      t.text :calculation, default: ""
      t.float :sla_target, default: 0

      t.timestamps
    end
  end
  def self.down
    drop_table :service_levels
  end
end
