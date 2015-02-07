
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
  redirect "/feed/#{@user.id}"
end

get "/feed/:id" do
  @user = User.find(session[:id])
  @hollers = Holler.all
  erb :feed
end

# get '/signin' do
#   @
# end

post '/signin' do
  @authenticate = User.find_by (params[:user])
  # checking for username and password user[:user_name] and user[:password]
  if @authenticate
    session[:id] = @authenticate.id
  else
    redirect '/'
  end
  redirect "/feed/#{@authenticate.id}"
end

get '/log_out' do
  session.delete(:id)
  redirect '/'
end

# get "/feed/:id" do
#   @user = User.find(session[:id])
#   @hollers = Holler.all
#   erb :feed
# end

post '/holler' do
  @id = params[:id]
  @holler = Holler.create( content: params[:tweet], user_id: session[:id])
  redirect "/feed/#{session[:id]}"
end

get '/user/:user_handle' do
  @original_user = User.find(session[:id])
  @user = User.find_by(user_handle: params[:user_handle])
  erb :user
end

get '/follow/:user_handle' do
  @following_id = User.find_by( user_handle: params[:user_handle]).id
  @follow = Follow.create(follower_id: , followed_id: session[:id]"#{@following_id}")
  redirect "/feed/#{session[:id]}"
end


get '/home' do
  redirect "/feed/#{session[:id]}"
end
