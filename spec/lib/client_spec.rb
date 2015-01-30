require 'spec_helper'

module Nibble
  context Client do
    before do
      Config.load(File.expand_path(File.dirname(__FILE__) + '/../fixtures/config.yml'))

      @client = Client.new
    end

    it "rotates ears", vcr: true do
      result = @client.ears left: 5, right: 5
      expect(result).to eql({"left"=>"5", "right"=>"5", "return"=>"0"})
    end
  end
end
