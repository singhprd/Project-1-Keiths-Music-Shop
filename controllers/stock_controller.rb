# INDEX
get '/stocks' do
  erb :'stocks/index'
end

# NEW
get '/stocks/new' do
  erb :'stocks/new'
end

# CREATE
post '/stocks' do
  erb :'stocks/create'
end

# SHOW
get '/stocks/:id' do
  erb :'stocks/show'
end

# EDIT
get '/stocks/:id/edit' do
  erb :'stocks/edit'
end

# UPDATE 
put '/stocks/:id' do
  erb :'stocks/update'
end

# DESTROY
delete '/stocks/:id/delete' do
  erb :'stocks/index'
end