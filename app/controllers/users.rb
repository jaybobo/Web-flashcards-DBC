enable :sessions

get '/users' do
  @user = User.find_by(id: session[:value])
  if @user
    erb :"users/index"
  else
    redirect to('/')
  end
end

get '/users/' do
  redirect to ('/users')
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
    redirect to("/users")
  else
    erb :"users/login"
  end
end

# for new users
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:value] = User.last.id
    redirect to ('/users')
  else
    erb :"users/new"
  end
end
