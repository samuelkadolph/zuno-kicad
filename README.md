# zuno-kicad

## Installation

### From repository

### From file

Download the version you want from the [Releases](../../releases) page or the
[latest](../../releases/latest).

In KiCAD, open the `Plugin and Content Manager` window and click `Install from file...`.

[![Click on install from file...](images/install_from_file.png "Plugin and Content Manager")](images/install_from_file.png)

Select the zip file you downloaded and click `Open`.

[![Pick the zip file to install](images/select_zip.png "File Picker")](images/select_zip.png)

The plugin should now show up under the `Installed` tab.

[![List of installed plugins](images/installed.png "Installed Plugins")](images/installed.png)

## Build from source

```
rake clean build
```

This create a zip file in the build directory. With that zip file you can follow
the [instructions above for installing from a file](#from-file).

## Repository
