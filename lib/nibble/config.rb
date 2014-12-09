require "yaml"

module Nibble
  class Config
    def self.dump(path = "config.yml")
      File.open(path, 'w') do |f| 
        puts "writing defaults to #{File.absolute_path(f)}"

        f.write(YAML.dump(defaults))
      end
    end

    def self.load(path)
      @config = YAML.load(File.read(path))
    end

    def self.defaults
      {
        connection: {ip: "10.0.1.200"},
        ttl: {voice: "andreas", nocache: "0", mute: "0"},
      }
    end

    def self.[](key)
      @config[key] || defaults[key]
    end
  end
end
