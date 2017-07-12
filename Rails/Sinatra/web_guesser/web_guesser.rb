require 'sinatra'
require 'sinatra/reloader'
# Methods
def check_guess(guess)
  if guess >  SECRET_NUMBER
    return "Too high!"
  elsif guess <  SECRET_NUMBER
    return "Too Low !"
  else
  return "Just right"
  end
end
# init variables
SECRET_NUMBER = rand(100)
# Sinatra Things...
get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index ,
  :locals => {
    :secret_number   => SECRET_NUMBER,
    :guess           => guess,
    :message         => message
  }
end
