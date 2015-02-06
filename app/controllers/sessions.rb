get '/session/new' do
  erb :'/session/new'
end

post '/session' do
  if session_authenticate(params[:session][:email], params[:session][:password])
    redirect session_redirect_target
  else
    @session_error = 'Invalid Username or Password'
    erb :'/session/new'
  end
end

get '/session/logout' do
  session_logout_and_redirect
end


delete '/session' do
  session_logout_and_redirect
end


get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session_set_current_user @user
    redirect session_redirect_target
  else
    erb :'users/new'
  end
end
