require 'spec_helper'

describe "cates/show" do
  before(:each) do
    @cate = assign(:cate, stub_model(Cate))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
