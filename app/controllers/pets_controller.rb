class PetsController < ApplicationController
  get '/pets/new' do 
    erb :'/pets/new'
  end
  
  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  post '/pets' do 
  @pet = Pet.create(params[:pet])
    if !params[:owner][:name].empty?
      @pet.owners << Owner.create(name: params[:owner][:name])
     
    end
    redirect "owners/#{@owner.id}"
    
  end
  get '/pets/:id/edit' do
    @pet= Pet.find_by_id(params[:id])
    erb :'/pets/edit'
  end

  get '/pets/:id' do 
    @pet= Pet.find_by_id(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
    @pet= Pet.find_by_id(params[:id])
     @pet.update(params[:pet])
   if !params[:owner][:name].empty?
      @owner.pets << Pet.create(name: params[:owner][:name])
   end
   redirect "owners/#{@owner.id}"
   end
end