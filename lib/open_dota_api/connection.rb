require 'httparty'

module OpenDotaApi
  class Connection
    include HTTParty
    base_uri ENV['OPENDOTA_API'] || 'api.opendota.com'

    def get(pathname, options = {})
      query = { api_key: OpenDotaApi.configuration.api_key }
      options[:query] ? options[:query].merge!(query) : options[:query] = query
      self.class.get(pathname, options)
    end

    def post(pathname, options = {})
      self.class.post(pathname, options)
    end
  end
end
