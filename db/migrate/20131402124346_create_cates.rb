class CreateCates < ActiveRecord::Migration
  def change
    create_table :cates do |t|
    	t.string :cate_name
    	
      t.timestamps
    end
  end
end
