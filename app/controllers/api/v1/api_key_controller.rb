class API::V1::APIKeyController < ApplicationController

  #Need to build on this for more security, however to start off with can be this basic

  def index
    @apiKeys = APIKey.all
    respond_to do |format|
      format.json { render :json => @apiKeys}
    end
  end

  def create
    @key = APIKey.new
    @key.save
    respond_to do |format|
      format.json { render :json => @key }
    end
  end

end