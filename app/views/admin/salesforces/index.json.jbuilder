json.array!(@admin_salesforces) do |admin_salesforce|
  json.extract! admin_salesforce, :id, :username, :password, :client_id, :client_secret, :security_token
  json.url admin_salesforce_url(admin_salesforce, format: :json)
end
