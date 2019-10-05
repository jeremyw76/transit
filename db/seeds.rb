base_url = 'https://api.winnipegtransit.com/v3/stops.json'
api_key = Rails.application.credentials.dig(:wpg_transit_api_key)
url = "%s?api-key=%s&x=633861&y=5525798&distance=30000" % [base_url, api_key]

response = RestClient::Request.execute(method: :get, url: url)

stops = JSON.parse(response.body)['stops']

BusStop.destroy_all
Street.destroy_all

stops.each do |stop|
  street = get_or_add_street(stop['street'])
  cross_street = get_or_add_street(stop['cross-street'])
  position = stop['geographic']

  BusStop.create(
    number: stop['key'],
    name: stop['name'],
    direction: stop['direction'],
    side: stop['side'],
    street: street,
    cross_street: cross_street,
    latitude: position['latitude'],
    longitude: positoin['longitude']
  )
end

def get_or_add_street(street)
  street_key = street['key']
  street_object = Street.find_by_key(street_key)

  if (!street_object) then
    street_object = Street.create(key: street_key, name: street['name'])
  end

  return street_object
end
