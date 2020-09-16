class ApartmentsController < ApplicationController
  set :views, 'app/views/apartments'

  get '/apartments' do
    @apartments = Apartment.all
    erb :index
  end

  get '/apartments/new' do 
    erb :new
  end

  post '/apartments' do
    apartment = Apartment.create(params)
    redirect "/apartments"
  end

  get '/apartments/:id/edit' do
    @apartment = Apartment.find(params[:id])
    erb :edit
  end

  get '/apartments/:id' do
    @apartment = Apartment.find(params[:id])
    # binding.pry
    erb :show
  end

  delete '/apartments/:id' do 
    apartment = Apartment.find(params[:id])
    apartment.destroy
    redirect "/apartments"
  end


  # add controller methods
end
