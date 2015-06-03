json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :recipient, :transaction_type, :amount
  json.url transaction_url(transaction, format: :json)
end
