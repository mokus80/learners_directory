module API 
  class V1 < Grape::API
  	format :json
  	prefix '/api'
    

  	resource :resources do 
  		desc "return all resources"
  		get '/' do
  			Resource.all
  		end
  	end
  end
end
