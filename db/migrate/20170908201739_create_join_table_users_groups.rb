class CreateJoinTableUsersGroups < ActiveRecord::Migration[5.1]
  def self.up
    create_join_table :groups, :users do |t|
      t.index [:group_id, :user_id]
    end
  end
  def self.down
    drop_join_table :groups, :users
  end
end
