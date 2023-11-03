require "digest"
require "json"
require "yaml"
require "zip"

module PCM
  module Repository
    PACKAGES_JSON = "repository/packages.json"
    PACKAGES_YAML = "repository/packages.yaml"

    REPOSITORY = {
      "$schema" => "https://gitlab.com/kicad/code/kicad/-/raw/master/kicad/pcm/schemas/pcm.v1.schema.json#/definitions/Repository",
      "maintainer" => {
        "name" => "Samuel Kadolph",
        "contact" => {
          "github" => "https://github.com/samuelkadolph/zuno-kicad"
        }
      },
      "name" => "Z-Uno Unofficial Repository",
      "packages" => {
        "url" => "https://github.com/samuelkadolph/zuno-kicad/raw/main/repository/packages.json"
      },
      "resources" => {
        "url" => "https://github.com/samuelkadolph/zuno-kicad/raw/main/repository/resources.zip"
      }
    }
    REPOSITORY_JSON = "repository/repository.json"

    RESOURCES_YAML = "repository/resources.yaml"
    RESOURCES_ZIP = "repository/resources.zip"

    def self.build
      build_packages
      build_resources
      build_repository
    end

    def self.build_packages
      versions = YAML.load_file(PACKAGES_YAML)["versions"]

      packages = { "packages" => [PCM.copy_metadata] }
      packages["packages"][0]["versions"] = []

      versions.each do |v|
        packages["packages"][0]["versions"] << v
      end

      File.open(PACKAGES_JSON, "w") { |f| f << PCM.pretty_json(packages) }
    end

    def self.build_repository
      now = Time.now
      packages_sha256 = Digest::SHA256.hexdigest(File.read(PACKAGES_JSON))
      resources_sha256 = Digest::SHA256.hexdigest(File.read(RESOURCES_ZIP))

      repository = PCM.interpolate(REPOSITORY)
      repository["packages"]["sha256"] = packages_sha256
      repository["packages"]["update_time_utc"] = now.utc.strftime("%Y-%m-%d %H:%M:%S")
      repository["packages"]["update_timestamp"] = now.to_i
      repository["resources"]["sha256"] = resources_sha256
      repository["resources"]["update_time_utc"] = now.utc.strftime("%Y-%m-%d %H:%M:%S")
      repository["resources"]["update_timestamp"] = now.to_i

      File.open(REPOSITORY_JSON, "w") { |f| f << PCM.pretty_json(repository) }
    end

    def self.build_resources
      resources = PCM.interpolate(YAML.load_file(RESOURCES_YAML))

      ::Zip::File.open(RESOURCES_ZIP, create: true) do |z|
        resources.each do |r|
          z.add(r["file"], r["source"]) if r.key?("file")
        end
      end
    end
  end
end
