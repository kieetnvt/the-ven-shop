class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_product(product_id)
  	current_item = line_items.find_by_product_id(product_id)
  	if current_item
  		current_item.quantity += 1
  	else 
  		current_item = line_items.build(product_id: product_id)
  	end
  	current_item
  end

  def total_price
  	line_items.to_a.sum {|item| item.total_price }
  end

  private
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
  end

end
