class API::V1::CustomerDetailsController < ApplicationController
  before_action :set_customer_detail, only: [:show, :edit, :update, :destroy]

  # GET /customer/[customer_id]/customer_details
  # GET /customer_details.json
  def index
    @customer = Customer.find_by_id(params[:customer_id])
    #Using create as I want to return 422 unprocessable entity (API)
    @customer_details = @customer.customer_detail!
    respond_to do |format|
      format.json { render :json => @customer_details }
    end
  end

  # GET /customer_details/new
  def new
    @customer_detail = CustomerDetail.new
  end

  # GET /customer_details/1/edit
  def edit
  end

  # POST /customer_details/[customer_id]/customer_details
  def create
    @customer = @customer = Customer.find_by_id(params[:customer_id])

    respond_to do |format|
      if @customer.create_customer_detail(customer_detail_params)
        format.json {  render :json => { :code => "201", :description => "Created customer"} }
      else
        format.json { render json: @customer_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_details/1
  def update
    respond_to do |format|
      if @customer_detail.update(customer_detail_params)
        format.json { head :no_content }
      else
        format.json { render json: @customer_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_details/1
  def destroy
    @customer_detail.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_detail
      @customer_detail = Customer.find(params[:customer_id]).CustomerDetail
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_detail_params
      params.require(:customer_detail).permit(:customerID, :dob, :telNumber, :street, :city, :county, :postCode, :licenceType, :licenceHeldSince, :occupation, :quotesStored, :incidents)
    end
end
