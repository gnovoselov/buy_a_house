require 'rails_helper'

RSpec.describe "houses/show", type: :view do
  before(:each) do
    @house = assign(:house, House.create!(
      photo: "Photo",
      address: "Address",
      zillow_id: "Zillow"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Zillow/)
  end
end
