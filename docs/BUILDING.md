# Building QyVern

## To build and edit "QyVern", you need these prerequisites

* Scoop (For installing Lua and VSCodium)
* Lua (Very important)
* LuaJIT (For running)
* A code editor (Recommending VSCodium, Notepad++, Sublime)
* Basic programming knowledge on Lua

## Installing Lua

If you have scoop installed, you can run this in your terminal.

``` sh
scoop install lua
```

## Installing LuaJIT

If you want to download LuaJIT, here's a zip download for it.

> *https://luajit.org/download/LuaJIT-2.0.5.zip*

**NOTE: The current version for LuaJIT that you are currently about to download is 2.0.5.**

Next, copy the path of the extracted zip file of the LuaJIT folder.

After that, open up a Developer Command prompt of Visual Studio 2019 with MSVC installed.

Then run:

``` sh
cd [LuaJIT-Directory]
msvcbuild
```

If you know how to set enviroment variables to your system, then just make a new path then paste in the LuaJIT directory in that newly created path.

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

## Choosing a code editor...

If you wanna have something lightweight and modern, you can install VSCodium. (Highly recommended)

**DL Link: https://vscodium.com/**

Manual Install **(With Scoop)**:

``` sh
scoop install vscodium
```

More Options:

**Sublime Text: https://www.sublimetext.com/3**

**Notepad++: https://notepad-plus-plus.org/downloads/**

## Extra optional prerequisites

* Scoop
* PSUtils (Must be installed with Scoop)

*PSUtils* can be used to run the pipeline shell scripts, since they consist of commands from Linux.

**PSUtils repository**: ``https://github.com/lukesampson/psutils``
