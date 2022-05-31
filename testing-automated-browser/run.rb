require 'capybara'
require 'webdrivers/chromedriver'
require 'capybara/dsl'
extend Capybara::DSL
Capybara.default_driver = :selenium_chrome

