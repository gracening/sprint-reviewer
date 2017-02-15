json.extract! model, :id, :table, :author, :date, :body, :team, :created_at, :updated_at
json.url model_url(model, format: :json)