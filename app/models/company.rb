class Company
  include Mongoid::Document
  has_one :campaign
  field :name,            type: String
  # shares held by the company's founders.
  field :ordinary_shares, type: Hash
  field :founders,        type: User
end
