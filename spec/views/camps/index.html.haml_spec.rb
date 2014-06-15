require 'rails_helper'

RSpec.describe "camps/index", :type => :view do
  before(:each) do
    assign(:camps, [
      Camp.create!(
        :name => "Name",
        :description => "Description",
        :bitcoin_address => "Bitcoin Address"
      ),
      Camp.create!(
        :name => "Name",
        :description => "Description",
        :bitcoin_address => "Bitcoin Address"
      )
    ])
  end

  it "renders a list of camps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Bitcoin Address".to_s, :count => 2
  end
end
