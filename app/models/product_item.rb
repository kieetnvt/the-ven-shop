class ProductItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :total_price
  belongs_to :order
  belongs_to :product
end
