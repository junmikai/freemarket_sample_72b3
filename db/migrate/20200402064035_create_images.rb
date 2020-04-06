class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image1, null:false
      t.string :image2
      t.string :image3
      t.string :image4
      t.integer :product_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
