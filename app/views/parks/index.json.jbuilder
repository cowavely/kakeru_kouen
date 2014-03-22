json.array!(@parks) do |park|
  json.extract! park, :id, :name, :address, :description
  json.url park_url(park, format: :json)
end
