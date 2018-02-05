
# rubocop:disable all
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'webmock/rspec'
require 'JSON'

WebMock.disable_net_connect!(allow_localhost: true)


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::Console,
   SimpleCov::Formatter::HTMLFormatter]
 )
SimpleCov.start

RSpec.configure do |config|

  #
  config.before(:each) do
    stub_request(:get, "http://driftrock-dev-test.herokuapp.com/purchases?page=1&per_page=100").
         with(  headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: File.read("purchasesPage1.json"), headers: {})


    stub_request(:get, "http://driftrock-dev-test.herokuapp.com/purchases?page=2&per_page=100").
        with(  headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: File.read("purchasesPage2.json"), headers: {})

    stub_request(:get, "http://driftrock-dev-test.herokuapp.com/purchases?page=3&per_page=100").
         with(  headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: File.read("empty.json"), headers: {})

     stub_request(:get, "http://driftrock-dev-test.herokuapp.com/users?page=1&per_page=100").
       with(  headers: {
     	  'Accept'=>'*/*',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'User-Agent'=>'Ruby'
         }).
       to_return(status: 200, body: File.read("usersPage1.json"), headers: {})

     stub_request(:get, "http://driftrock-dev-test.herokuapp.com/users?page=2&per_page=100").
       with(  headers: {
     	  'Accept'=>'*/*',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'User-Agent'=>'Ruby'
         }).
       to_return(status: 200, body: File.read("usersPage2.json"), headers: {})

       stub_request(:get, "http://driftrock-dev-test.herokuapp.com/users?page=3&per_page=100").
         with(  headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: File.read("empty.json"), headers: {})

  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
