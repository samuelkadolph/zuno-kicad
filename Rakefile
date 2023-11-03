require_relative "lib/pcm"

task default: %W[clean build]

task "build" do
  PCM::Zip.make("build/Z-Uno_KiCAD_v{{ VERSION }}.zip")
end

task "clean" do
  FileUtils.rm_rf(Dir["build/*"])
end

task "repository" => %w[repository:clean repository:build]

task "repository:build" do
  PCM::Repository.build
end

task "repository:clean" do
  FileUtils.rm_rf(Dir["repository/*.{json,zip}"])
end
