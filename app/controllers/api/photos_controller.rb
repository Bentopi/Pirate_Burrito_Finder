class Api::PhotosController < ApplicationController

  before_action do
    request.format = :json
  end

  def list
    @photos = Photo.all
  end
end
