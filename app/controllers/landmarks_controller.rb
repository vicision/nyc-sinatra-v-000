class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    if !params["figure"]["name"].empty?
      @landmark.figure = Figure.create(name: params["figure"]["name"])
    end
    # if !params["title"]["name"].empty?
    #   @landmark.titles << Title.create(name: params["title"]["name"])
    # end
    # if !params["landmark"]["name"].empty?
    #   @landmark.landmarks << Landmark.create(name: params["landmark"]["name"])
    # end
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:name]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
