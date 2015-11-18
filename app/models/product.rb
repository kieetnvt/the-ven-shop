# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :integer
#  img_small  :string(255)
#  cate_id    :integer
#  img_medium :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  
  attr_accessible :product,:img_medium, :img_small, :name, :price, :cate_id, :user_id, :cate_name, :rate, :count, :info
  has_many :line_items
  has_many :product_items

  before_destroy :ensure_not_referenced_by_any_line_item
  
  # search do 
  #   text :name, :desciption
  # end

  



  private
  def ensure_not_referenced_by_any_line_item
  	if line_item.empty?
  		return true
  	else
  		errors.add(:base, 'Line Items Present')
  		return false
  	end
  end
end
