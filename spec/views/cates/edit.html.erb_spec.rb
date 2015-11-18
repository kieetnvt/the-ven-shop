require 'spec_helper'

describe "cates/edit" do
  before(:each) do
    @cate = assign(:cate, stub_model(Cate))
  end

  it "renders the edit cate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cates_path(@cate), :method => "post" do
    end
  end
end
