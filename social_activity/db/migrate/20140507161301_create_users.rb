class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.date :birth_date
      t.string :gender
      t.string :profil_image
      t.text :adress
      t.string :password

      t.timestamps
    end
  end
end
