# CoinCoins are 'options' held by backers
# to receive funds under certain conditions.
class CoinCoin
  include Mongoid::Document
  field :bc_id,           type: String
  field :payload,         type: Hash
end
