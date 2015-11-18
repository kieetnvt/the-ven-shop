require 'spec_helper'

describe "product_items/edit" do
  before(:each) do
    @product_item = assign(:product_item, stub_model(ProductItem,
      :product_id => 1,
      :order_id => 1,
      :quantity => 1,
      :total_price => "9.99"
    ))
  end

  it "renders the edit product_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_items_path(@product_item), :method => "post" do
      assert_select "input#product_item_product_id", :name => "product_item[product_id]"
      assert_select "input#product_item_order_id", :name => "product_item[order_id]"
      assert_select "input#product_item_quantity", :name => "product_item[quantity]"
      assert_select "input#product_item_total_price", :name => "product_item[total_price]"
    end
  end
end
