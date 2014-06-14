require 'rails_helper'

RSpec.describe "contracts/edit", :type => :view do
  before(:each) do
    @contract = assign(:contract, Contract.create!(
      :amount => 1,
      :owner => ""
    ))
  end

  it "renders the edit contract form" do
    render

    assert_select "form[action=?][method=?]", contract_path(@contract), "post" do

      assert_select "input#contract_amount[name=?]", "contract[amount]"

      assert_select "input#contract_owner[name=?]", "contract[owner]"
    end
  end
end
