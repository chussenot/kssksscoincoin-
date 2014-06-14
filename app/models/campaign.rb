class Campaign
  include Mongoid::Document

  field :name,            type: String
  field :description,     type: String
  field :start_date,      type: Date
  field :end_date,        type: Date

  has_many :transactions
  has_one :company

  # Founders can create transaction
  # they have to mention how many shares they want to create
  # and how many coincoins for share
  # @param shares [Integer] the number of shares to create
  # @param share_value [Integer] the coincoins value of each shares
  # @return [Transaction] the new transaction
  def create_transaction shares, share_value
    t = Transaction.new
    t.shares = shares
    t.goal = shares * share_value
    t.save
    transactions << t
    company.add_shares shares
    company.save
    t
  end

  # @return [Integer] the amount of coincoins to this campaign
  def coincoin_amount
    transactions.map(&:gaol).reduce(:+)
  end
end
