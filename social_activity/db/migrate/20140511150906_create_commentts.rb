class CreateCommentts < ActiveRecord::Migration
  def change
    create_table :commentts do |t|
      t.integer :user_id
      t.integer :activity_id
      t.text :body

      t.timestamps
    end
  end
end
