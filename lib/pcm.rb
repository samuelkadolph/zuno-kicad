require_relative "metadata"

module PCM
  require_relative "pcm/repository"
  require_relative "pcm/zip"

  def self.copy_metadata
    interpolate(METADATA)
  end

  def self.interpolate(obj)
    case obj
    when Array
      obj.map(&method(:interpolate))
    when Hash
      obj.transform_values(&method(:interpolate))
    when String
      obj.gsub(/{{ *NAMESPACE *}}/, NAMESPACE).gsub(/{{ *VERSION *}}/, VERSION)
    else
      obj
    end
  end

  def self.pretty_json(obj)
    JSON.pretty_generate(obj) << "\n"
  end
end
