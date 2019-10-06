namespace :db do
  desc "Hits the Transit endpoint for routes using every known stop, and writes the result to the db."
  task seed_routes: :environment do

    api_key = Rails.application.credentials.dig(:wpg_transit_api_key)

    Variant.destroy_all
    BusRoute.destroy_all

    # Sync all routes first

    base_url = 'https://api.winnipegtransit.com/v3/routes.json'
    url = "%s?api-key=%s" % [base_url, api_key]

    response = RestClient::Request.execute(method: :get, url: url)
    routes = JSON.parse(response.body)['routes']

    routes.each do |route|
      BusRoute.create(number: route['number'], name: route['name'], customer_type: route['customer-type'], coverage: route['coverage'])
    end

    puts "#{routes.count} bus routes seeded successfully."

    # Sync all variants using batches of bus stops to call the Transit api

    base_url = 'https://api.winnipegtransit.com/v3/variants.json'

    BusStop.find_in_batches(batch_size: 41) do |group|
      stop_numbers = group.pluck(:number).join(",")
      url = "%s?api-key=%s&stops=%s" % [base_url, api_key, stop_numbers]

      response = RestClient::Request.execute(method: :get, url: url)
      variants = JSON.parse(response.body)['variants']

      variants.each do |variant|
        key = variant['key']
        name = variant['name']
        route_number = key.split('-').first
        route = BusRoute.where(number: route_number).first

        if (!Variant.find_by(key: key)) then
          Variant.create(key: key, name: name, bus_route: route)
        end
      end
    end

    puts "#{Variant.all.count} variants seeded successfully."
  end

  task seed_schedules: :environment do
  end
end
