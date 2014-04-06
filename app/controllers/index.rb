get '/' do
  if session[:value]
    @user = User.find(session[:value])
    erb :"users/index"
  else
    erb :index
  end
end

get '/new' do
  erb :new
end

get '/login' do
  erb :login
end
