class HomeController < ApplicationController
  def index
  	@campaigns = Campaign.all.to_a
  end
end
