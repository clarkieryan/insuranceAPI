class API::V1::IncidentsController < ApplicationController
  before_action :set_quote
  before_action :set_incident, only: [ :show, :edit, :update, :destroy]

  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = @quote.incidents.all
    respond_to do |format|
      format.json { render :json => @incidents }
    end
  end

  # POST /incidents
  # POST /incidents.json
  def create
    #@incident = @quote.incidents.new(incident_params)
    logger.info params[:incident]
    params[:incident].each do |incident|
      @incident = @quote.incidents.new(incident)
      @incident.save
    end
    respond_to do |format|
        format.json {  render :json => { :code => "201", :description => "Created incidents"} }
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.json { head :no_content }
      else
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = @quote.incidents.find(params[:id])

    end
  def set_quote
    @quote = Customer.find(params[:customer_id]).quotes.find(params[:quote_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      logger.info :customer_id
      params.permit(:date, :value, :type, :desc, :incident)
    end
end
