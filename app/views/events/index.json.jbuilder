json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :starts_at, :ends_at, :title, :description
  json.url event_url(event, format: :json)
end
