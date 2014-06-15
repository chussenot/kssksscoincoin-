

class API < Grape::API
  format :json
	get :ping do
	  'pong'
	end

  post :option do
    {payload: @@bitcoind.listtransactions()}
  end

  get :transactions do
    {payload: @@bitcoind.listtransactions()}
  end
end