class API < Grape::API
  format :json
	get :ping do
	  'pong'
	end

  post :option do
    {payload: 'GKèg!hjk7890gkjhb769'}
  end
end