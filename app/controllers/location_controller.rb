require 'cgi'
class LocationController < ApplicationController

  def locate
    @location = params[:location]

    results = JSON.parse(Http.get("http://locationiq.org/v1/search.php?key=adff1ce289577c56596f&format=json&q=#{CGI::escape(@location)}").body)

    if results != []
      session[:location] = results.first
      session[:location]["zoom"] = 14
      redirect_to root_path
    else
      redirect_to root_path, notice: "Address not found!"
    end
  end

  def reset
    session[:location] = nil
    redirect_to root_path
  end
end
