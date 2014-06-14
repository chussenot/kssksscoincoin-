class User
  include Mongoid::Document
  field :email, type: String

  def create_coinbase 
    # Obtaining the OAuth credentials is outside the scope of this gem
    user_credentials = {
      :access_token => 'access_token',
      :refresh_token => 'refresh_token',
      :expires_at => Time.now.to_i + 100
    }
    @coinbase = Coinbase::OAuthClient.new(Gaston.coinbase.client_id, Gaston.coinbase.client_secret, user_credentials)
  end

  def balance
    @coinbase.balance
  end

  def pay! user, amount, notes = 'KssKss'
    r = @coinbase.send_money user.email, amount, notes
    r
  end

  def pay_coincoin! transaction, amount = 1
    result = pay!
    CoinCoin.new({
      payload: result.to_hash
    })
  end

end
