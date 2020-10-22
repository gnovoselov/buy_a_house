require 'rails_helper'

RSpec.describe "houses/new", type: :view do
  before(:each) do
    assign(:house, House.new(
      photo: "MyString",
      address: "MyString",
      zillow_id: "MyString"
    ))
  end

  it "renders new house form" do
    render

    assert_select "form[action=?][method=?]", houses_path, "post" do

      assert_select "input[name=?]", "house[photo]"

      assert_select "input[name=?]", "house[address]"

      assert_select "input[name=?]", "house[zillow_id]"
    end
  end
end
