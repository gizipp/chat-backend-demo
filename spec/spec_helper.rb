ENV["RACK_ENV"] ||= 'test'

require './app.rb'
require 'rack/test'
require 'mongoid-rspec'

def app
  App
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Mongoid::Matchers

  config.before(:each) do
    Mongoid.purge!
  end
end
