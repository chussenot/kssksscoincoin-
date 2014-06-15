# @@bitcoind method
# https://blockchain.info/api/json_rpc_api

class API < Grape::API
  format :json
	get :ping do
	  'pong'
	end

  post :pledge do
    txid            = params[:transaction_id]
    vout            = params[:vout].to_i
    bitcoin_address = params[:bitcoin_address]
    pledge_amount   = params[:pledge_amount].to_f
    tx_input  = [{txid: txid ,vout: 0}]
    tx_output = { "#{bitcoin_address}" => pledge_amount}
    @@bitcoind.decoderawtransaction @@bitcoind.createrawtransaction(tx_input, tx_output)
  end

  get :transactions do
    @@bitcoind.listtransactions()
  end
  
end