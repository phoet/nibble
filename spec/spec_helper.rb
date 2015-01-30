require 'rspec'
require 'nibble'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.around(:each, vcr: true) do |example|
    name = example.metadata[:full_description].downcase.gsub(/\W+/, "_").split("_", 2).join("/")
    VCR.use_cassette(name, record: :new_episodes, match_requests_on: [:host, :path]) do
      example.call
    end
  end
end
