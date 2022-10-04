# Modifying QyVern is quite an easy process

*NOTE: There is a template for you to get the basis of making a module for QyVern*

*ANOTHER NOTE: Before making a QyVern .lua module, make sure to read GUIDELINES.txt*

- Open the *"src"* folder and open up ext_modules
- Make a new folder and name it to the desired name of your module
- Do some coding for the module and port it to *init_client.lua* with the require function
  > ``"local mod = require(ext_modules.module_name.module_script)"``
  
  *- ``init_client.lua`` can be located in ``src > modules > init``*
