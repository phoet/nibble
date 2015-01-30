require "nibble/version"
require "nibble/config"
require "nibble/client"

module Nibble
  def self.run(args)
    abort("usage: #{__FILE__} --generate-config OR config.yml script.rb") if args.size < 1

    if ARGV.first == "--generate-config"
      Config.dump
    else
      abort("usage: #{__FILE__} config.yml script.rb") if args.size != 2
      Config.load(args.first)

      script = File.read(args.last)

      client = Client.new
      client.instance_eval(script)
    end
  end
end
