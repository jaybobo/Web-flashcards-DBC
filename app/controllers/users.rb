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

get 'users/:id' do
  redirect to ('/users')
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
