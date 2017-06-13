get '/users/new' do
  if request.xhr?
    erb :"/users/_register_form", layout: false
  else
    erb :'users/new'
  end
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


get '/users/login' do
  if request.xhr?
    erb :'users/_login_form', layout: false
  else
    erb :'users/login'
  end
end

post '/users/login' do
  username_attempt = params[:username]
  password_attempt = params[:password]
  @user = User.authenticate(username_attempt, password_attempt)

  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = ["Sad broccoli, invalid credentials"]
    erb :"/users/login"
  end
end

delete '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

