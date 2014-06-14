class HomeController < ApplicationController
  def index
  	@campaigns = Campaign.all
  end
end
