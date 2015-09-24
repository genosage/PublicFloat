json.array!(@artworks) do |artwork|
  json.extract! artwork, :id, :name, :description, :artwork_longtitude, :artwork_latitude, :title, :image_url, :ibeaconuuid
  json.url artwork_url(artwork, format: :json)
end
