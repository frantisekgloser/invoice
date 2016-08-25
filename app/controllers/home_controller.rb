class HomeController < ApplicationController
after_action REDIS.INCR request.fullpath

  def index
  end
  
end