require 'spec_helper'

describe "product_items/index" do
  before(:each) do
    assign(:product_items, [
      stub_model(ProductItem,
        :product_id => 1,
        :order_id => 2,
        :quantity => 3,
        :total_price => "9.99"
      ),
      stub_model(ProductItem,
        :product_id => 1,
        :order_id => 2,
        :quantity => 3,
        :total_price => "9.99"
      )
    ])
  end

  it "renders a list of product_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
