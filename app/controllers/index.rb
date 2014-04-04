get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/new' do
  erb :new
end

get '/login' do
  erb :login
end
