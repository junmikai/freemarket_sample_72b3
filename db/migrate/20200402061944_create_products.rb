class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :price
      t.string  :description
      t.string  :status
      # t.string  :size
      t.string  :shipping_cost
      t.string  :shipping_days
      t.string  :prefecture_id
      # t.string  :judgment
      t.integer :category_id, foreign_key: true
      # t.integer :shipping_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
