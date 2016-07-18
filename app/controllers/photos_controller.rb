class PhotosController < ApplicationController
    def new
        @photo = Photo.new
        @treasuremap = Treasuremap.find_by id: params[:id]
    end

    def create
        @photo = Photo.new
        @photo.location = params[:photo][:location]
        @photo.treasuremap_id = params[:id]
        @photo.attachment = params[:photo][:attachment]
        @photo.description = params[:photo][:description]
        @location = params[:photo][:location]

        results = JSON.parse(Http.get("http://locationiq.org/v1/search.php?key=adff1ce289577c56596f&format=json&q=#{CGI.escape(@location)}").body)
        @photo.latitude = results[0]['lat']
        @photo.longitude = results[0]['lon']

        if results != []
            if @photo.save

                session[:location]['zoom'] = 14
                redirect_to photo_path(photo_id: @photo.id, id: @photo.treasuremap.id), notice: "You're good to go!"
            else
                render :new, notice: 'Upload Failed!'
            end

        else
            render :new, notice: 'Location not found!'
        end
    end

    def show
        @treasuremap = Treasuremap.find_by id: params[:id]
        @photo = Photo.find_by id: params[:photo_id]
    end
end
