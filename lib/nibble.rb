require "nibble/version"
require "nibble/config"
require "nibble/client"

module Nibble
  def self.run(args)
    abort("usage: #{__FILE__} --generate-config OR config.yml script.rb") if args.size != 2

    if ARGV.first == "--generate-config"
      Config.dump
    else
      Config.load(args.first)

      script = File.read(args.last)

      client = Client.new(args.first)
      client.instance_exec(script)
    end
  end
end
