require 'cgi'
class LocationController < ApplicationController

  def locate
    @location = params[:location]

    results = JSON.parse(Http.get("http://locationiq.org/v1/search.php?key=adff1ce289577c56596f&format=json&q=#{CGI::escape(@location)}").body)

    session[:location] = results.first
    session[:location]["zoom"] = 14
    redirect_to root_path
  end

  def reset
    session[:location] = nil
    redirect_to root_path
  end
end
