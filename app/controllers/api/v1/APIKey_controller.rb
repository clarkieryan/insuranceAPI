class API::V1::APIKeyController < ApplicationController

  def create
    @key = APIKey.new
    respond_to do |format|
      format.json { render :json => @key }
    end
  end

end