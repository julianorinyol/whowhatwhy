json.array!(@hangouts) do |hangout|
  json.extract! hangout, :id
  json.url hangout_url(hangout, format: :json)
end
