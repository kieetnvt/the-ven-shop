class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :img_small
      t.string :img_medium
      t.integer :user_id
      t.integer :cate_id
      t.string :cate_name
      t.string :rate
      t.string :count
      t.string :info
      

      t.timestamps
    end
  end
end
