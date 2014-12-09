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
      @config = deep_merge(defaults, YAML.load(File.read(path)))
    end

    def self.defaults
      {
        connection: {ip: "10.0.1.200"},
        wakeup: {silent: 0},
        ttl: {voice: "andreas", nocache: 0, mute: 0},
        leds: {color: "00FF00", color2: "00FF00", pulse: 0, speed: 700, no_memory: 0},
        ears: {noreset: 1, left: 0, right: 0},
      }
    end

    def self.[](key)
      @config[key]
    end

    def self.deep_merge(target, hash)
      hash.keys.each do |key|
        if hash[key].is_a? Hash and target[key].is_a? Hash
          target[key] = deep_merge(target[key], hash[key])
          next
        end

        target[key] = hash[key]
      end
      target
    end
  end
end
