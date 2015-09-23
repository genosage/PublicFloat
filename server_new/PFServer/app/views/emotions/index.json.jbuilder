json.array!(@emotions) do |emotion|
  json.extract! emotion, :id, :emotion_name, :artwork_id
  json.url emotion_url(emotion, format: :json)
end
