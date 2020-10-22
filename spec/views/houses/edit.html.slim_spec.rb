require 'rails_helper'

RSpec.describe "houses/edit", type: :view do
  before(:each) do
    @house = assign(:house, House.create!(
      photo: "MyString",
      address: "MyString",
      zillow_id: "MyString"
    ))
  end

  it "renders the edit house form" do
    render

    assert_select "form[action=?][method=?]", house_path(@house), "post" do

      assert_select "input[name=?]", "house[photo]"

      assert_select "input[name=?]", "house[address]"

      assert_select "input[name=?]", "house[zillow_id]"
    end
  end
end
