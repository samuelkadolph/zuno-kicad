NAMESPACE = "com.github.samuelkadolph.zuno-kicad"
VERSION = "0.3.0"

METADATA = {
  "$schema" => "https://go.kicad.org/pcm/schemas/v1",
  "name" => "Z-Uno",
  "type" => "library",
  "identifier" => "{{ NAMESPACE }}",
  "license" => "MIT",
  "description" => "Symbols and footprints for Z-Uno 1 and Z-Uno 2",
  "description_full" => "Z-Uno is the first and only easy-to-use developer board that allows you to create your own Z-Wave device without deep knowledge of Z-Wave protocol or programming. Z-Uno is a mix of Z-Wave home automation radio protocol power and Arduino simplicity. Being inspired by the Arduino project Z-Uno inherits all concepts of easy-to-use hardware and software solutions, keeping maximum flexibility.",
  "tags" => ["z-uno", "z-wave", "zuno", "zwave"],
  "author" => {
    "name" => "Samuel Kadolph",
    "contact" => {
      "github" => "https://github.com/samuelkadolph",
      "web" => "https://samuel.kadolph.com/"
    }
  },
  "resources" => {
    "github" => "https://github.com/samuelkadolph/zuno-kicad",
    "datasheet" => "https://z-uno.z-wave.me/technical",
    "web" => "https://z-uno.z-wave.me/"
  },
  "versions" => [
    {
      "download_url" => "https://github.com/samuelkadolph/zuno-kicad/releases/download/v{{ VERSION }}/Z-Uno_KiCAD_v{{ VERSION }}.zip",
      "kicad_version" => "7",
      "status" => "development",
      "version" => "{{ VERSION }}"
    }
  ]
}
