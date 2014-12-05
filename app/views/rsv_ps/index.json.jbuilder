json.array!(@rsvps) do |rsvp|
  json.extract! rsvp, :id, :user_id, :event_id, :guest_count
  json.url rsvp_url(rsvp, format: :json)
end
