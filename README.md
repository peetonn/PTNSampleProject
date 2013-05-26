iOS app sample project 
================

This is a sample Xcode project for empty iOS application. It allows to quickly and comfortably deploy a workspace for new ready-to-code Xcode project.

What does it include?
---
Sample project contains following configured features:

- [Logic unit testing](http://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/UnitTesting/02-Setting_Up_Unit_Tests_in_a_Project/setting_up.html#//apple_ref/doc/uid/TP40002143-CH3-SW5)
- [Application unit testing](http://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/UnitTesting/02-Setting_Up_Unit_Tests_in_a_Project/setting_up.html#//apple_ref/doc/uid/TP40002143-CH3-SW6) with linking to [OCMock library](http://ocmock.org/)
- Automatic generation of HTML documentation upon app archiving (if you have [Appledoc](http://gentlebytes.com/appledoc/) installed)
- Configured logging (by [PTNLogger](https://github.com/peetonn/PTNArtifacts))
- Configured storage (by [PTNStorage](https://github.com/peetonn/PTNArtifacts))

Logic unit testing
---
In order to provide unit testing for the classes of your app, you need to complete [these steps](http://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/UnitTesting/02-Setting_Up_Unit_Tests_in_a_Project/setting_up.html#//apple_ref/doc/uid/TP40002143-CH3-SW5). They are already configured in this project.


Application unit testing
---
Application unit testing allows to perform unit tests on actual device (or simulator as well). [These instuctions](http://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/UnitTesting/02-Setting_Up_Unit_Tests_in_a_Project/setting_up.html#//apple_ref/doc/uid/TP40002143-CH3-SW6) are completed in current project and ready to test. Additionaly, you can enjoy using [OCMock](http://ocmock.org/) library functionality in your tests.

Documentation
---
[Appledoc](http://gentlebytes.com/appledoc/) allows apple-style documentation generation based on comments left in code. It is configured by _AppledocSettings.plist_ file. The script for documentation generation is placed in _Documentation_ target of a project and is executed upon app archiving. Script executes `appledoc` command (so it will not work if you don't have appledoc installed on your system) and archives generated HTML documentation folder into .tar.bz file. 

Logging
---
Project is configured to use PTNLogger (see [PTNArtifacts](https://github.com/peetonn/PTNArtifacts) for more details).

Storage
---
Project is configured to use PTNStorage (see [PTNArtifacts](https://github.com/peetonn/PTNArtifacts) for more details).

How to use
===
1. Clone PTNSampleProject into folder named corresponds to your new project.
2. Run _setup.sh_ script with the name of your project as an argument.
3. Start developing

Example
---
For instance, you are going to start awesome app called **SuperApp**. Here are steps you need to perform before starting to write code: 

    $ git clone https://github.com/peetonn/PTNSampleProject SuperApp
    $ cd SuperApp
    $ ./setup.sh SuperApp

That's it! Now you just open _SuperApp.xcworkspace_ (if you declined to open it from _setup.sh_ script) and Xcode drops you to your new configured ready-to-code environment!

Enjoy your code!