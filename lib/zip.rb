require "json"
require "zip"

require_relative "version"

module PCM
  module Zip
    FILES = %W[footprints/*.pretty/* resources/icon.png symbols/*.kicad_sym]

    class << self
      def make(output)
        ::Zip::File.open(sub(output), create: true) do |z|
          Dir[*FILES].each do |f|
            z.get_output_stream(f) { |s| s << File.read(f) }
          end

          metadata = JSON.load_file("metadata.json")
          metadata["versions"][0]["download_url"] = sub(metadata["versions"][0]["download_url"])
          metadata["versions"][0]["version"] = sub(metadata["versions"][0]["version"])

          z.get_output_stream("metadata.json") { |s| s << metadata.to_json << "\n" }
        end
      end

      private
      def sub(str)
        str.gsub(/{{ *VERSION *}}/, VERSION)
      end
    end
  end
end
