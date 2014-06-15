require 'rails_helper'

RSpec.describe "camps/new", :type => :view do
  before(:each) do
    assign(:camp, Camp.new(
      :name => "MyString",
      :description => "MyString",
      :bitcoin_address => "MyString"
    ))
  end

  it "renders new camp form" do
    render

    assert_select "form[action=?][method=?]", camps_path, "post" do

      assert_select "input#camp_name[name=?]", "camp[name]"

      assert_select "input#camp_description[name=?]", "camp[description]"

      assert_select "input#camp_bitcoin_address[name=?]", "camp[bitcoin_address]"
    end
  end
end
