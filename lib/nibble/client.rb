require "json"
require "faraday"

module Nibble
  class Client
    def initialize
      @conn = Faraday.new(url: "http://#{Config[:ip]}") do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
      end
    end

    def talk(text, options = {})
      options = .merge(options)
      execute(:tts, options)
    end

    def execute(method, options = {})
      response = @conn.get("/cgi-bin/tts", options)
      JSON.parse(response.body)
    end
  end
end
