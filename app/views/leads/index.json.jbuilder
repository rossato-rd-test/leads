json.array!(@leads) do |lead|
  json.extract! lead, :id, :name, :last_name, :email, :company, :job_title, :phone, :website, :salesforce_id, :salesforce_updated_at
  json.url lead_url(lead, format: :json)
end
