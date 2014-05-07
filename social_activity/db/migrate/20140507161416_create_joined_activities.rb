class CreateJoinedActivities < ActiveRecord::Migration
  def change
    create_table :joined_activities do |t|
      t.integer :user_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
