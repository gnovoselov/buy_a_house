require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  before(:each) do
    assign(:properties, [
      Property.create!(
        name: "Name",
        value: 2
      ),
      Property.create!(
        name: "Name",
        value: 2
      )
    ])
  end

  it "renders a list of properties" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
