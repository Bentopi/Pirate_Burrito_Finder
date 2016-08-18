class Api::MeController < ApplicationController
  before_action :doorkeeper_authorize!


  # GET /me.json
  def me
   @current_user = current_resource_owner
  end

  private

  # Find the user that owns the access token
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
