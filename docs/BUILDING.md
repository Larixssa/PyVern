# Building QyVern

## To build and edit "QyVern", you need these prerequisites

* Lua 5.4 (Very important)
* LuaJIT (For running)
* A code editor (Recommending VSCode, Notepad++, Sublime)
* Basic programming knowledge on Lua

## Installing QyVern

Open up your terminal and type these down:

``` sh
git clone https://github.com/Equinoxtic/QyVern
cd QyVern
```

* Do this when you **ONLY** have *git* installed.
* If you don't then click the green "Code" button and then press "Download ZIP"
* Extract the .zip folder into any location you desire.

## Running QyVern

Once you have LuaJIT installed, open up the terminal again and run:

``` sh
luajit src/main.lua
```

## Extra optional prerequisites

* Scoop
* PSUtils (Must be installed with Scoop)

*PSUtils* can be used to run the pipeline shell scripts, since they consist of commands from Linux.

**PSUtils repository**: ``https://github.com/lukesampson/psutils``
