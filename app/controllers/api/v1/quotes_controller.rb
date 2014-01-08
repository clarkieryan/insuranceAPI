class API::V1::QuotesController < ApplicationController
  before_filter :restrict_access
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Customer.find(params[:customer_id]).quotes
    respond_to do |format|
      format.json { render :json => @quotes}
    end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    respond_to do |format|
      format.json {  render :json => @quote }
    end
  end


  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Customer.find(params[:customer_id]).quotes.new(quote_params)
    
    respond_to do |format|
      if @quote.save
        format.json { render :json => { :code => "201", :description => "Created quote", :quote => @quote} }
      else
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)

        format.json { head :no_content }
      else
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # GET /quote/test@test.com/3 
  # Get's a customers whole set of quote
  def getQuote
    @customer = Customer.find_by_email(params[:email])
    if @customer 
      @customer_details = @customer.customer_detail
      @quote = @customer.quotes.find_by_id(params[:id])
      if @quote 
        @incidents = @quote.incidents
      end
    end
    respond_to do |format|
      format.json { render :json => { :customer => @customer, :customer_details => @customer_details, :body => @quote,  :incidents => @incidents } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Customer.find(params[:customer_id]).quotes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      r = Random.new
      #Get a new random integer between 300 and 800
      rand = r.rand(300..800)

      params.require(:quote).permit(:customer_id, :incident_id, :vehicleReg, :estimatedMileage, :estimatedVehicleValue, :parkingLocation, :policyExcess, :breakdownCover, :breakdownType, :windscreenCover, :windscreenExcess).merge(premium: rand)
    end

    def restrict_access
      api_key = APIKey.find_by_access_token(params[:access_token])
      if !api_key
        respond_to do |format|
          format.json { render :json => {:error => "Access Denied", :description => "API Key not found/supplied"} }
        end
      else
        api_key
      end
    end
end