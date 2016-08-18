class WelcomeController < ApplicationController


  def index
    @search_done = false
    @current_location = session[:location]
    if @current_location.nil?
      @current_location = { "lat" => 37.620584, "lon" => -97.259945, "zoom" => 5 }
    else
      @search_done = true
      lat = @current_location["lat"]
      lon = @current_location["lon"]

      url = "https://api.foursquare.com/v2/venues/search?query=burrito&ll=#{lat},#{lon}&client_id=QJNE4GB5I20ZNYEJMY2W0F05BJ2SRFBLI3LV4SXWMG2IRSC4&client_secret=HGZW1QT05VRLK2BKBT1XDRNE5IUI3SRZFGSHPDCD0RGUADOB&v=20160715"

      json = JSON.parse(Http.get(url).body)

      @venues = json["response"]["venues"]
    end
  end
end
