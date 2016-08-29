require 'redis'

class ApplicationController < ActionController::Base 

  after_action :counter

  include Pundit
  protect_from_forgery
  
  REDIS = Redis.new(:host => ENV["REDIS_HOST"], :port => ENV["REDIS_PORT"])

  private

  def counter
    if params == nil then
        @counter = "home/index"
      else
        @counter = params["controller"].to_s + "/" + params["action"].to_s
      end
    REDIS.INCR @counter
  end
end
