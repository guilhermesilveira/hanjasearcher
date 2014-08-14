json.array!(@hanjas) do |hanja|
  json.extract! hanja, :id, :name
  json.url hanja_url(hanja, format: :json)
end
