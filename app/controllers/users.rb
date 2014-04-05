enable :sessions

get '/users' do
  erb :"users/index"
end

get '/users/' do
  erb :"users/index"
end

get '/users/new' do
  erb :"users/new"
end

# get '/users/:id' do
#   redirect to ('/users')
# end

get '/users/login' do
  erb :"users/login"
end

get '/users/logout' do
  session.clear
  redirect to '/'
end

post '/users/login' do
  @user = User.find_by(user_email: params[:user_email])

  if @user && @user.authenticate(params[:password])
    session[:value] = @user.id
    erb :"/users/index"
  else
    erb :"users/login"
  end
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:value] = User.last.id
    redirect to ('/users')
  else
    erb :"users/new"
  end
end
