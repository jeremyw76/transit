namespace :db do
  desc "Hits the Transit endpoint for routes using every known stop, and writes the result to the db."
  task seed_routes: :environment do
    base_url = 'https://api.winnipegtransit.com/v3/variants.json'
    api_key = Rails.application.credentials.dig(:wpg_transit_api_key)

    BusStop.find_in_batches(batch_size: 41) do |group|
      stop_numbers = group.pluck(:number).join(",")
      stop_numbers = 40001
      url = "%s?api-key=%s&stops=%s" % [base_url, api_key, stop_numbers]

      response = RestClient::Request.execute(method: :get, url: url)
      # routes = JSON.parse(response.body)['variants']

      puts(url)
    end
  end
end
