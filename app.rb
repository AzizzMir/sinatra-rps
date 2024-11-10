require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:index)
end

#rock route
get("/rock") do
  options = ["rock", "paper", "scissors"]
  @option = options.sample
    if @option == "paper"
      @result = "lost"
    elsif @option == "scissors"
      @result = "won"
    else
      @result = "tied"
    end
  erb(:rock)
end

#paper route
get("/paper") do
  options = ["rock", "paper", "scissors"]
  @option = options.sample
    if @option == "scissors"
      @result = "lost"
    elsif @option == "rock"
      @result = "won"
    else
      @result = "tied"
    end
  erb(:paper)
end

#scissors route
get("/scissors") do
  options = ["rock", "paper", "scissors"]
  @option = options.sample
    if @option == "rock"
      @result = "lost"
    elsif @option == "paper"
      @result = "won"
    else
      @result = "tied"
    end
  erb(:scissors)
end
