require 'sinatra/base'

class ToDoPin < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names/new' do
    session[:username] = params[:username]
    redirect '/names'
  end

  get '/names' do
    @username = session[:username]
    erb :'users/index'
  end

  post '/tasks/new' do
    session[:taskTitle] = params[:taskTitle]
    session[:taskDetail] = params[:taskDetail]
    redirect '/tasks'
  end

  get '/tasks' do
    @task_title = session[:taskTitle]
    @task_detail = session[:taskDetail]
    erb :'tasks/index'
  end

  get '/tasks/:taskTitle' do
    @task_title = session[:taskTitle]
    @task_detail = session[:taskDetail]
    erb :'tasks/filter'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
