class CreateActivityImages < ActiveRecord::Migration
  def change
    create_table :activity_images do |t|
      t.integer :activity_id
      t.string :image

      t.timestamps
    end
  end
end
