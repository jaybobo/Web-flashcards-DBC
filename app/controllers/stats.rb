get "/stats/local"  do
  @user = User.find_by(id: session[:value])

  erb :"stats/local/index"
end

get "/stats/global"  do
  @user = User.find_by(id: session[:value])

  erb :"stats/global/index"
end
