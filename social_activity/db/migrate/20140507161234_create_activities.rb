class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :place_name
      t.text :place_adress
      t.date :start_date
      t.date :finish_date
      t.string :paid
      t.string :age_group
      t.string :gender
      t.text :explain

      t.timestamps
    end
  end
end
