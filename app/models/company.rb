class Company
  include Mongoid::Document
  has_many :campaigns
  field :name,            type: String
  # shares held by the company's founders.
  field :ordinary_shares, type: Integer
  field :founders,        type: User


  def shares
  	ordinary_shares
  end
end
