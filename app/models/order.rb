class Order < ActiveRecord::Base
  attr_accessible :address, :name, :email, :pay_type
  has_many :product_items
  PAYMENT_TYPES = [
	[ "Check" ,"check" ],
	[ "Credit card" ,"cc" ],
	[ "Purchase order" , "po" ]
]
def add_line_items_from_cart(cart)
cart.items.each do |item|
li = LineItem.from_cart_item(item)
line_items << li
end
end
end
