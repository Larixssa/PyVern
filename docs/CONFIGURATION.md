In order to run QyVern, you need to add the necessary configuration files.

[comment]: <Install this zip folder, containing all the config files.>
[comment]: <[QyVern Config Files](https://github.com/Equinoxtic/QyVern/files/9712672/config.zip)>
[comment]: <Now extract the zip folder, and drag the "config" folder to QyVern's folder.>
[comment]: <If you wanna do it manually, follow this set of commands in the QyVern folder:>

-------------------------------------------------------------------------------

> Initializing content

``` sh
mkdir "config"

# WINDOWS [POWERSHELL]
ni "config/cursor.txt"
ni "config/id.txt"
ni "config/profile.txt"
ni "config/repo-desc.txt"
ni "config/selection-cursor.txt"

# LINUX
touch "config/cursor.txt"
touch "config/id.txt"
touch "config/profile.txt"
touch "config/repo-desc.txt"
touch "config/selection-cursor.txt"
```

-------------------------------------------------------------------------------

> Writing content

You can set up your own Username and ID later on once done setting up.

Copy these strings on the following files.

**config/cursor.txt** : ``$``

**config/repo-desc.txt** :

``` txt
QyVern

A Command-Line Interface (CLI) and engine for creating and running scripts.

Requires LuaJIT (2.0.5) + Modding Support with Lua.

NOTE: Check docs/BUILDING.md and docs/MODIFYING.md for guides on building / modding QyVern.
```

**config/selection-cursor.txt** : ``>``
