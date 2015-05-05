# GET =========================================================================

get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new(params[:contact])
  if request.xhr?
    erb :'contacts/_form', layout: false
  else
    erb :'contacts/new'
  end
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end


# POST ========================================================================

post '/contacts' do
  @contact = Contact.new(params[:contact])
  if @contact.save
    if request.xhr?
      erb :'contacts/_row', layout: false, locals: {contact: @contact}
    else
      redirect '/contacts'
    end
  else
    response.status = 422
    erb :'contacts/new'
  end
end

# PUT =========================================================================

put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact.update_attributes(params[:contact])
    redirect '/contacts'
  else
    response.status = 422
    erb 'contacts/edit'
  end
end

# DELETE ======================================================================

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end