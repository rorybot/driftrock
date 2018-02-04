
# rubocop:disable all
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
# require_relative 'helpers/session_helpers.rb'

# require File.join(File.dirname(__FILE__), '../app/', 'app.rb')

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::Console,
   SimpleCov::Formatter::HTMLFormatter]
 )
SimpleCov.start

RSpec.configure do |config|

  # 
  # config.before(:suite) do
  #
  # end
  #
  # config.around(:each) do |example|
  #
  # end
  #
  # config.after(:each) do
  # end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
