require 'sinatra/base'

class ToDoPin < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello ToDoPin!'
    erb :index
  end

  post '/names' do
    session[:username] = params[:username]
    redirect '/tasks'
  end

  get '/tasks' do
    @username = session[:username]
    erb :user
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
