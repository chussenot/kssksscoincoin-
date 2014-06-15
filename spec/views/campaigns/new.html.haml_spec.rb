require 'rails_helper'

RSpec.describe "campaigns/new", :type => :view do
  before(:each) do
    assign(:campaign, Campaign.new(
      :name => "MyString",
      :description => "MyString",
      :bitcoin_address => "MyString"
    ))
  end

  it "renders new campaign form" do
    render

    assert_select "form[action=?][method=?]", campaigns_path, "post" do

      assert_select "input#campaign_name[name=?]", "campaign[name]"

      assert_select "input#campaign_description[name=?]", "campaign[description]"

      assert_select "input#campaign_bitcoin_address[name=?]", "campaign[bitcoin_address]"
    end
  end
end
