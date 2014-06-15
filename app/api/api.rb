class API < Grape::API
  format :json
	get :ping do
	  'pong'
	end
end