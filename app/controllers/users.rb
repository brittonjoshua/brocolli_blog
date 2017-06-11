get '/users/new' do
  erb :'users/new'
end

post '/users' do
 p  params
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end


get '/login' do
  erb :'users/login'
end

post '/login' do
  username_attempt = params[:username]
  password_attempt = params[:password]
  @user = User.authenticate(username_attempt, password_attempt)

  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = ["Sad broccoli, invalid credentials"]
    erb :"/login"
  end
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end

