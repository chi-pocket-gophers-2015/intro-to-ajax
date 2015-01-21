# GET =========================================================================

get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end