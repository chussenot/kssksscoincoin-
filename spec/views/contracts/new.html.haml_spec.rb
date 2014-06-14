require 'rails_helper'

RSpec.describe "contracts/new", :type => :view do
  before(:each) do
    assign(:contract, Contract.new(
      :amount => 1,
      :owner => ""
    ))
  end

  it "renders new contract form" do
    render

    assert_select "form[action=?][method=?]", contracts_path, "post" do

      assert_select "input#contract_amount[name=?]", "contract[amount]"

      assert_select "input#contract_owner[name=?]", "contract[owner]"
    end
  end
end
