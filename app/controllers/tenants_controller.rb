class TenantsController < ApplicationController
  set :views, 'app/views/tenants'
  # add controller methods

  get '/tenants' do
    @tenants = Tenant.all
    erb :index
  end

  get '/tenants/new' do 
    erb :new
  end
  
  
  
  get '/tenants/:id/edit' do
    @tenant = Tenant.find(params[:id])
    erb :edit
  end
  
  post '/tenants' do
    tenant = Tenant.create(name: params[:name])
    redirect "/tenants"
  end
  
  patch '/tenants/:id' do 
    tenant = Tenant.find(params[:id])
    tenant.update(params[:tenant])
    redirect "/tenants/#{tenant.id}"
  end
  

  get '/tenants/:id' do
    @tenant = Tenant.find(params[:id])
    erb :show
  end

  delete '/tenants/:id' do 
    tenant = Tenant.find(params[:id])
    tenant.destroy
    redirect "/tenants"
  end

end
