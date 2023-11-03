require "json"
require "zip"

module PCM
  module Zip
    FILES = %W[footprints/*.pretty/* resources/icon.png symbols/*.kicad_sym]

    def self.make(output)
      ::Zip::File.open(PCM.interpolate(output), create: true) do |z|
        Dir[*FILES].each do |f|
          z.get_output_stream(f) { |s| s << File.read(f) }
        end

        z.get_output_stream("metadata.json") { |s| s << PCM.pretty_json(PCM.copy_metadata) }
      end
    end
  end
end
