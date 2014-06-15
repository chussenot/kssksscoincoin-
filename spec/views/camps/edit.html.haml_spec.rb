require 'rails_helper'

RSpec.describe "camps/edit", :type => :view do
  before(:each) do
    @camp = assign(:camp, Camp.create!(
      :name => "MyString",
      :description => "MyString",
      :bitcoin_address => "MyString"
    ))
  end

  it "renders the edit camp form" do
    render

    assert_select "form[action=?][method=?]", camp_path(@camp), "post" do

      assert_select "input#camp_name[name=?]", "camp[name]"

      assert_select "input#camp_description[name=?]", "camp[description]"

      assert_select "input#camp_bitcoin_address[name=?]", "camp[bitcoin_address]"
    end
  end
end
