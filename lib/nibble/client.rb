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

    METHODS = %i(leds tts wakeup sleep get_version status voice_list display_cache clear_cache)
    METHODS.each do |method|
      define_method(method) do |*args|
        options = args.first || {}
        options = (Config.defaults[method] || {}).merge(options)
        execute(method, options)
      end
    end

    def say(text, options = {})
      tts(options.merge(text: text))
    end

    def execute(method, options = {})
      response = @conn.get("/cgi-bin/#{method}", options)
      JSON.parse(response.body)
    end
  end
end
