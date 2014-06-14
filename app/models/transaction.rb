class Transaction
  include Mongoid::Document

  # people who funded the company via the platform KissKissCOinCOin
  # Number of backers: n (fixed to begin with, then it will improve)
  field :backers,       type: User
  field :coincoins,     type: CoinCoin
  field :address,       type: String
  field :goal,          type: Integer
  field :shares,        type: Integer
  before_create :generate_address

  private
  def generate_address

  end
end
