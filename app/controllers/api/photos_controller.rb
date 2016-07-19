class Api::PhotosController < ApplicationController

  protect_from_forgery with: :null_session

  before_action :doorkeeper_authorize!


  before_action do
    request.format = :json
  end

  def list
    @photos = Photo.all
  end

end
