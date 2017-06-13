# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

post '/entries' do
  if logged_in? && current_user
      @entry = current_user.entries.new(params[:entry])

      if @entry.save
        redirect "/entries/#{@entry.id}"
      else
        @errors = @entry.errors.full_messages
        erb :'entries/new'
      end
  else
    status 403
    erb :"403"
  end

end

get '/entries/new' do
  if logged_in? && current_user
    if request.xhr?
      p binding
      erb :'entries/_new_form', layout: false
    else
      erb :'entries/new'
    end
  else
    status 403
    erb :"403"
  end
end

get '/entries/:id' do
    @entry = find_and_ensure_entry(params[:id])
    erb :'entries/show'
end

put '/entries/:id' do
  if logged_in? && current_user
      # if authorized_user?
      @entry = find_and_ensure_entry(params[:id])
      @entry.assign_attributes(params[:entry])

      if @entry.save
        redirect "entries/#{@entry.id}"
      else
        @errors = @entry.errors.full_messages
        erb :'entries/edit'
      end
  else
     status 403
     erb :"403"
  end
end

delete '/entries/:id' do
  if logged_in? && current_user
  # if authorized_user?
    @entry = find_and_ensure_entry(params[:id])
    @entry.destroy
    redirect '/entries'
  else
     status 403
     erb :"403"
  end
end

get '/entries/:id/edit' do
  if logged_in? && current_user
    # if authorized_user?
    @entry = find_and_ensure_entry(params[:id])
    erb :'entries/edit'
  else
       status 403
       erb :"403"
  end
end
