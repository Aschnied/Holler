get '/' do
  erb :index
end

post '/signup' do
  @user = User.create(params[:user])
  if @user.save
    session[:id] = @user.id
  else
    redirect '/'
  end
  redirect '/feed'
end

post '/signin' do
  @authenticate = User.find_by ( params[:user])
  # checking for username and password user[:user_name] and user[:password]
  if @authenticate
    session[:id] = @authenticate.id
  else
    redirect '/'
  end
  redirect '/feed'
end

get '/log_out' do
  redirect '/'
end

get '/feed' do
  @user = User.find(session[:id])
  @hollers = Holler.all
  erb :feed
end



get '/user/:id' do
  @user = User.find(params[:id])

  erb :user_page
end



