class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
    	t.string :name
    	t.integer :price
    	t.string :cate_name
    	t.string :info
      t.timestamps
    end
  end
end
