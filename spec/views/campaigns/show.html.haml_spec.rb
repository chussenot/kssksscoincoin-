require 'rails_helper'

RSpec.describe "campaigns/show", :type => :view do
  before(:each) do
    @campaign = assign(:campaign, Campaign.create!(
      :name => "Name",
      :description => "Description",
      :bitcoin_address => "Bitcoin Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Bitcoin Address/)
  end
end
