# @@bitcoind method
# https://blockchain.info/api/json_rpc_api

class API < Grape::API
  format :json
	get :ping do
	  'pong'
	end

  # {"txid":"8e067237d49fde2d86c0e2153aed6d0a5654b681d7319b43d042abe9e6474687","version":1,"locktime":0,"vin":[{"txid":"e3ba2ac29c70b3c5183adf0ca4ef9d7578ff0db4d857ffc94a7ca8c105a7fca8","vout":0,"scriptSig":{"asm":"","hex":""},"sequence":4294967295}],"vout":[{"value":0.345,"n":0,"scriptPubKey":{"asm":"OP_DUP OP_HASH160 27f46fd86300c43c0521178735342397a9c2b700 OP_EQUALVERIFY OP_CHECKSIG","hex":"76a91427f46fd86300c43c0521178735342397a9c2b70088ac","reqSigs":1,"type":"pubkeyhash","addresses":["mjADUJra6U1jDsdHXZ6JwAU4iaVKMzaXi7"]}}]} 
  post :pledge do
    txid            = params[:transaction_id]
    vout            = params[:vout].to_i
    bitcoin_address = params[:bitcoin_address]
    pledge_amount   = params[:pledge_amount].to_f
    tx_input        = [{txid: txid ,vout: 0}]
    tx_output       = { "#{bitcoin_address}" => pledge_amount}
    begin
      raw    = @@bitcoind.createrawtransaction(tx_input, tx_output)
      deflat = @@bitcoind.decoderawtransaction raw
      {raw: raw, deflat: deflat.to_json}
    rescue Exception => e
      e.message
    end
  end

  get :transactions do
    @@bitcoind.listtransactions()
  end

  post :sign do
    transaction_sign    = params[:transaction_sign]
    campaign_id         = params[:campaign_id]
    campaign            = Campaign.find(campaign_id)
    campaign.transaction_signs = [] if campaign.transaction_signs.nil? 
    campaign.transaction_signs << transaction_sign
    campaign.save
    if campaign.transaction_signs.size == 2
      a = campaign.transaction_signs.first
      b = campaign.transaction_signs.last
      raw = "#{a[0,8]}02#{a.split('ffffffff').first[10..-1]}ffffffff#{b.split('ffffffff').first[10..-1]}ffffffff#{a.split('ffffffff').last}"
      @@bitcoind.sendrawtransaction(raw)
    else
      {accept: true}
    end
  end
  
end