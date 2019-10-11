module BusStopsHelper
  def self.sign_static_map_url(stop)
    key = Rails.application.credentials.dig(:google_maps_api_key)
    center = "#{stop.latitude},#{stop.longitude}"
    stripped_url = "/maps/api/staticmap?center=#{center}&zoom=15&size=400x400&markers=color:red|#{center}&key=#{key}"
    base_url = "https://maps.googleapis.com"
    secret = Rails.application.credentials.dig(:google_maps_signature_secret)

    decoded_key = Base64.urlsafe_decode64(secret)

    digest = OpenSSL::Digest.new('sha1')
    raw_signature = OpenSSL::HMAC.digest(digest, decoded_key, stripped_url)
    signature = Base64.urlsafe_encode64(raw_signature)

    "#{base_url}#{stripped_url}&signature=#{signature}"
  end
end
