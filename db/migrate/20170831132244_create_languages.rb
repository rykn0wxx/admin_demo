class CreateLanguages < ActiveRecord::Migration[5.1]
  def self.up
    create_table :languages do |t|
      t.references :region, foreign_key: true
      t.string :name
      t.string :label

      t.timestamps
    end
  end
  def self.down
    drop_table :languages
  end
end
