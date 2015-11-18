require 'spec_helper'

describe "cates/new" do
  before(:each) do
    assign(:cate, stub_model(Cate).as_new_record)
  end

  it "renders new cate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cates_path, :method => "post" do
    end
  end
end
