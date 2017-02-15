json.extract! table, :id, :author, :date, :body, :team, :created_at, :updated_at
json.url table_url(table, format: :json)