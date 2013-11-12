class QuoteDetailsController < ApplicationController
  before_action :set_quote_detail, only: [:show, :edit, :update, :destroy]

  # GET /quote_details
  # GET /quote_details.json
  def index
    @quote_details = QuoteDetail.all
  end

  # GET /quote_details/1
  # GET /quote_details/1.json
  def show
  end

  # GET /quote_details/new
  def new
    @quote_detail = QuoteDetail.new
  end

  # GET /quote_details/1/edit
  def edit
  end

  # POST /quote_details
  # POST /quote_details.json
  def create
    @quote_detail = QuoteDetail.new(quote_detail_params)

    respond_to do |format|
      if @quote_detail.save
        format.json { render action: 'show', status: :created, location: @quote_detail }
      else
        format.json { render json: @quote_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_details/1
  # PATCH/PUT /quote_details/1.json
  def update
    respond_to do |format|
      if @quote_detail.update(quote_detail_params)
        format.json { head :no_content }
      else
        format.json { render json: @quote_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_details/1
  # DELETE /quote_details/1.json
  def destroy
    @quote_detail.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_detail
      @quote_detail = QuoteDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_detail_params
      params[:quote_detail]
    end
end
