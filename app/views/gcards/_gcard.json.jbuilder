json.extract! gcard, :id, :code, :amount, :email, :description, :created_at, :updated_at
json.url gcard_url(gcard, format: :json)
