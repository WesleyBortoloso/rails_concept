class Api < Grape::API
  prefix 'api'
  format :json
  mount Surveys::V1
  mount Votes::V1
end
