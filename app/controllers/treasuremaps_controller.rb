class TreasuremapsController < ApplicationController
  def list
    @treasuremaps = Treasuremap.all
  end

  def show
    @treasuremap = Treasuremap.find_by id: params[:id]
    results = JSON.parse(Http.get("http://locationiq.org/v1/search.php?key=adff1ce289577c56596f&format=json&q=#{CGI::escape(@treasuremap.name)}").body)

    if results != []
      @treasuremap_location = results.first
      @treasuremap_location["zoom"] = 12
    else
      redirect_to edit_treasuremap_path(id: @treasuremap.id), notice: "Location not found, please update!"
    end
  end

  def new
   @treasuremap = Treasuremap.new
  end

  def create
    @treasuremap = Treasuremap.new
    @treasuremap.name = params[:treasuremap][:name]
    @treasuremap.user = @current_user

    if @treasuremap.save
      redirect_to treasuremap_path(id: @treasuremap.id), notice: "Map has been created! Add some Burritos!"
    else
      render :new
    end
  end

  def edit
    @treasuremap = Treasuremap.find_by id: params[:id]
  end

  def update
    @treasuremap = Treasuremap.find_by id: params[:id]
    @treasuremap.name = params[:treasuremap][:name]

    if @treasuremap.save
      redirect_to treasuremap_path(id: @treasuremap.id), notice: "Map Edit Complete"
    else
      render :edit
    end
  end

  def destroy
    @treasuremap = Treasuremap.find_by id: params[:id]
    @treasuremap.destroy
    redirect_to treasuremaps_path, notice: "Map Deleted!"
  end

end
