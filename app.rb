require 'sinatra'
require 'sinatra/reloader'
require 'koala'

get '/' do
  erb :index   
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'Alkatraz128'
    if @password == 'Rayman'
      erb :home
    else
      @error = "You just got stopped by my security, B*tch"
      erb :index
    end
  elsif @username == 'user'
    if @password == 'pass'
      session[:user] = 'user'
      redirect '/secrets'
    else
      @error = "Leave my F**king website!"
      erb :index
    end
  else
    @error = "Get the F**k out!!"
    erb :index
  end
end

get '/name' do
  @name = (params[:name] || "Nobody").downcase
  if @name == "Raiden"
    redirect 'http://www.reddit.com/r/funny'
  else
    erb :name
  end
end

post '/search' do
  redirect "http://#{params[:search]}.com"
end

get '/secrets' do
  @graph = Koala::Facebook::API.new()
  @picture = @graph.get_picture('raiden.westerman')
  erb :secret
end