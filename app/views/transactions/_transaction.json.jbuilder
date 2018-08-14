json.extract! transaction, :id, :account_id, :type, :sum, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
