class API::V1::CustomerDetailsController < ApplicationController
  before_filter :restrict_access
  before_action :set_customer_detail, only: [:index, :show, :edit, :update, :destroy]

  # GET /customer/[customer_id]/customer_details
  # GET /customer_details.json
  def index
    @customer = Customer.find_by_id(params[:customer_id])
    #Using create as I want to return 422 unprocessable entity (API)
    @customer_details = @customer.customer_detail
    respond_to do |format|
      format.json { render :json => @customer_details }
    end
  end


  # POST /customer_details/[customer_id]/customer_details
  def create
    #The find_by_id() can be shortened Customer
    @customer = Customer.find_by_id(params[:customer_id])
    @customer_details = @customer.create_customer_detail(customer_detail_params)
    respond_to do |format|
        format.json {  render :json => { :code => "201", :description => "Created customer details", :customer_details => @customer_details} }
    end
  end

  # PATCH/PUT /customer_details/1
  def update
    @customer = Customer.find_by_id(params[:customer_id])
    respond_to do |format|
      if @customer.update_customer_detail(customer_detail_params)
        format.json { head :no_content }
      else
        format.json { render json: @customer_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_details/1
  #TODO Will this destroy the attributed Customer object?
  def destroy
    @customer_detail.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_detail
      @customer_detail = Customer.find(params[:customer_id]).customer_detail
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_detail_params
      params.require(:customer_detail).permit(:customerID, :dob, :telNumber, :street, :city, :county, :postCode, :licenceType, :licenceHeldSince, :occupation, :quotesStored, :incidents)
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
