require 'rails_helper'

RSpec.describe "houses/index", type: :view do
  before(:each) do
    assign(:houses, [
      House.create!(
        photo: "Photo",
        address: "Address",
        zillow_id: "Zillow"
      ),
      House.create!(
        photo: "Photo",
        address: "Address",
        zillow_id: "Zillow"
      )
    ])
  end

  it "renders a list of houses" do
    render
    assert_select "tr>td", text: "Photo".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Zillow".to_s, count: 2
  end
end
