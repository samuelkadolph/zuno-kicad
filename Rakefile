require_relative "lib/zip"

task "build" do
  PCM::Zip.make("build/Z-Uno_KiCAD_v{{ VERSION }}.zip")
end

task "clean" do
  FileUtils.rm_rf(Dir["build/*"])
end

task default: %W[clean build]
