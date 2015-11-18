require 'spec_helper'

describe "line_items/index" do
  before(:each) do
    assign(:line_items, [
      stub_model(LineItem,
        :product_id => "Product",
        :cart_id => "Cart"
      ),
      stub_model(LineItem,
        :product_id => "Product",
        :cart_id => "Cart"
      )
    ])
  end

  it "renders a list of line_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    assert_select "tr>td", :text => "Cart".to_s, :count => 2
  end
end
