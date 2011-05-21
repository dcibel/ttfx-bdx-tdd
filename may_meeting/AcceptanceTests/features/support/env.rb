require 'rubygems'
require 'rspec'
require 'cucumber'
require 'selenium-webdriver'
require 'melomel'
require 'melomel/cucumber'

Before do |scenario|
  @driver = Selenium::WebDriver.for :firefox
  @driver.navigate.to "file://#{File.expand_path("bin-debug/AcceptanceTests.html")}"
  Melomel.connect()
end

After do |scenario|
  @driver.quit() unless @driver.nil?
end
