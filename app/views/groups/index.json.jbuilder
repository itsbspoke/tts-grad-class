json.array!(@groups) do |group|
  json.extract! group, :id, :name, :owner_id, :membership_count
  json.url group_url(group, format: :json)
end
