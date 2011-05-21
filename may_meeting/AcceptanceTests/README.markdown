B.D.D with Flex, getting started
================================

I'll assume that you have Flash Builder, Ruby and Gem installed.

Get required gems
-----------------
If you use [RVM](https://rvm.beginrescueend.com/), don't forget to [create a gemset](http://beginrescueend.com/gemsets/basics/).

* melomel : Ruby <-> Flash communication
* cucumber : B.D.D. tool
* rspec : used by melomel cucumber steps to define expecations
* selenium-webdriver : used to run you Flex application from the browser

One command line to get them all:

    gem install melomel cucumber rspec selenium-webdriver

You're ready to run the example !

Compile the project in Flex.

cd into the project and run

    cucumber

Useful links
------------
*  [Melomel official website](http://melomel.info/)
*  [Cucumber steps provided by Melomel](http://melomel.info/Cucumber)
*  [Melomel examples](https://github.com/benbjohnson/melomel-examples)


About versions...
-----------------
This project was tested with the following configuration:

* Flex 4.1
* Ruby 1.9.2
* cucumber 0.10.2
* melomel 0.6.2
* rspec 2.5.0
* selenium-webdriver 0.2.0
