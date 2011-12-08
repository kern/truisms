require "bundler/setup"
require "rspec/autorun"
require "truisms"

Dir["./spec/support/**/*.rb"].each { |f| require f }
