require 'rails_helper'

RSpec.describe "contracts/show", :type => :view do
  before(:each) do
    @contract = assign(:contract, Contract.create!(
      :amount => 1,
      :owner => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
