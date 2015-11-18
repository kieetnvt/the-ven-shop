require 'spec_helper'

describe "cates/index" do
  before(:each) do
    assign(:cates, [
      stub_model(Cate),
      stub_model(Cate)
    ])
  end

  it "renders a list of cates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
