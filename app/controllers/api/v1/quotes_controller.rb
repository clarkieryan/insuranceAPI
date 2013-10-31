class API::V1::QuotesController < ApplicationController
  # This class is used to generate ALL of the information for a quote
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  def index
    #Will return all the quotes stored
  end

  def show
    #Will return an individual quote
  end

  def new
    #Will create a new quote from information give
  end

  def create
    #Will be used to create a new quote
  end

  def update

  end

  def destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_quote
    @quote = Customer.find(params[:id])
      #Throw an error if the record couldn't be found
  rescue ActiveRecord::RecordNotFound
    @quote = { :error => "404", :description => "Customer could not be found"}
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  #Need to set these -> Will be user id etc. (Stored as hidden field frontend)
  def quote_params
    params.require(:quote).permit(:forename, :surname, :email)
  end
end