require 'rails_helper'

RSpec.describe "Contracts", :type => :request do
  describe "GET /contracts" do
    it "works! (now write some real specs)" do
      get contracts_path
      expect(response.status).to be(200)
    end
  end
end
