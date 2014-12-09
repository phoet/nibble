require "json"
require "faraday"

module Nibble
  class Client
    def initialize
      @conn = Faraday.new(url: "http://#{Config[:connection][:ip]}") do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
      end
    end

    def voice_list
      execute(:voice_list)
    end

    def tts(text, options = {})
      options = Config.defaults[:ttl].merge(options).merge(text: text)
      execute(:tts, options)
    end
    alias_method :talk, :tts
    alias_method :speak, :tts

    def execute(method, options = {})
      response = @conn.get("/cgi-bin/#{method}", options)
      JSON.parse(response.body)
    end
  end
end
