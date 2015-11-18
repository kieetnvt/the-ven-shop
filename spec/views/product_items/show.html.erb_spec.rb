require 'spec_helper'

describe "product_items/show" do
  before(:each) do
    @product_item = assign(:product_item, stub_model(ProductItem,
      :product_id => 1,
      :order_id => 2,
      :quantity => 3,
      :total_price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
  end
end
