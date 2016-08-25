require 'redis'

class ApplicationController < ActionController::Base 

  include Pundit
  protect_from_forgery

  REDIS = Redis.new(:host => ENV["REDIS_HOST"], :port => ENV["REDIS_PORT"])

end
