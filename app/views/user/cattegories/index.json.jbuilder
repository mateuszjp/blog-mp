json.array!(@cattegories) do |cattegory|
  json.extract! cattegory, :name
  json.url cattegory_url(cattegory, format: :json)
end
