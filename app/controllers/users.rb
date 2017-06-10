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

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end

