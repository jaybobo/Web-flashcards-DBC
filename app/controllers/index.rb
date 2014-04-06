get '/' do
  if session[:value]
    # added line 4, view couldn't find user
    @user = User.find_by(id: session[:value])
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
