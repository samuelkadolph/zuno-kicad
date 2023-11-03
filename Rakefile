require_relative "lib/pcm"

task default: %W[clean build]

desc "Build the plugin zip file"
task "build" do
  PCM::Zip.make("build/Z-Uno_KiCAD_v{{ VERSION }}.zip")
end

desc "Clean build directory"
task "clean" do
  FileUtils.rm_rf(Dir["build/*"])
end

desc "Clean and build repository"
task "repository" => %w[repository:clean repository:build]

desc "Build repository"
task "repository:build" do
  PCM::Repository.build
end

desc "Clean repository directory"
task "repository:clean" do
  FileUtils.rm_rf(Dir["repository/*.{json,zip}"])
end
