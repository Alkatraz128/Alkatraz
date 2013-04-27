ENV['RACK_ENV'] = 'development'

require 'rubygems'
require 'sinatra'
require 'bundler/setup'

require './app'
run Sinatra::Application