class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :adress
      t.boolean :is_user_or_activity
      t.integer :belong_id

      t.timestamps
    end
  end
end
