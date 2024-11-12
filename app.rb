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

#dynamic route
get("/:dynamic") do
  @user_option = params.fetch("dynamic")
  options = ["rock", "paper", "scissors"]
  @computer_option = options.sample
    if @user_option == "rock" and @computer_option == "paper"
      @result = "lost"
    elsif @user_option == "rock" and @computer_option == "scissors"
      @result = "won"
    elsif @user_option == "paper" and @computer_option == "scissors"
      @result = "lost"
    elsif @user_option == "paper" and @computer_option == "rock"
      @result = "won"
    elsif @user_option == "scissors" and @computer_option == "rock"
      @result = "lost"
    elsif @user_option == "scissors" and @computer_option == "paper"
      @result = "won"
    else
      @result = "tied"
    end

    erb(:flexible)
end

# #rock route
# get("/rock") do
#   options = ["rock", "paper", "scissors"]
#   @option = options.sample
#     if @option == "paper"
#       @result = "lost"
#     elsif @option == "scissors"
#       @result = "won"
#     else
#       @result = "tied"
#     end
#   erb(:rock)
# end

# #paper route
# get("/paper") do
#   options = ["rock", "paper", "scissors"]
#   @option = options.sample
#     if @option == "scissors"
#       @result = "lost"
#     elsif @option == "rock"
#       @result = "won"
#     else
#       @result = "tied"
#     end
#   erb(:paper)
# end

# #scissors route
# get("/scissors") do
#   options = ["rock", "paper", "scissors"]
#   @option = options.sample
#     if @option == "rock"
#       @result = "lost"
#     elsif @option == "paper"
#       @result = "won"
#     else
#       @result = "tied"
#     end
#   erb(:scissors)
# end
