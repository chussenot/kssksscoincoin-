require 'rails_helper'

RSpec.describe "campaigns/index", :type => :view do
  before(:each) do
    assign(:campaigns, [
      Campaign.create!(
        :name => "Name",
        :description => "Description",
        :bitcoin_address => "Bitcoin Address"
      ),
      Campaign.create!(
        :name => "Name",
        :description => "Description",
        :bitcoin_address => "Bitcoin Address"
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Bitcoin Address".to_s, :count => 2
  end
end
