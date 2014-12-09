require "yaml"

module Nibble
  class Config
    def self.load(path = "config.yml")
      File.open(path, 'w') do |f| 
        puts "writing defaults to #{File.absolute_path(f)}"

        YAML.dump(defaults)
      end
    end

    def self.load(path)
      @config = YAML.load(path)
    end

    def self.defaults
      {
        ttl: {voice: "andreas", nocache: "0", mute: "0"},
      }
    end

    def self.[](key)
      @config[key]
    end
  end
end
