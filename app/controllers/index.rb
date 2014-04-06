get '/' do
  @user = User.find_by(id: session[:value])
  if @user
    erb :"users/index"
  else
    redirect to('/')
  end
end

get '/new' do
  erb :new
end

get '/login' do
  erb :login
end
