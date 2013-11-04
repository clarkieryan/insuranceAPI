class API::V1::CustomersController < ApplicationController
  before_filter :restrict_access
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    #Respond to request will all data (Permissions maybe here)
    respond_to do |format|
      format.json { render :json => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
      respond_to do |format|
        format.json { render :json => @customer }
      end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:forename, :surname, :email)
    end

    def restrict_access
      api_key = APIKey.find_by_access_token(params[:access_token])
      if !api_key
        #TODO Add in proper code for unauthorised
        respond_to do |format|
          format.json { render :json => {:error => "Hell No", :description => "API Key not found/supplied"} }
        end
      else
        api_key
      end
    end
end