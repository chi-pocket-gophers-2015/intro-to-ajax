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
  erb :'contacts/new'
end


# POST ========================================================================

post '/contacts' do
  @contact = Contact.new(params[:contact])
  if @contact.save
    redirect '/contacts'
  else
    response.status = 422
    erb :'contacts/new'
  end
end
