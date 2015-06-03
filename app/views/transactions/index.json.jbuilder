json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :recipient, :description, :amount
  json.url transaction_url(transaction, format: :json)
end
