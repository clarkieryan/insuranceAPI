require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  setup do
    @controller = API::V1::QuotesController.new
    @quote = quotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post :create, quote: { breakdownCover: @quote.breakdownCover, customer_id: @quote.customer_id, estimatedMileage: @quote.estimatedMileage, estimatedVehicleValue: @quote.estimatedVehicleValue, incident_id: @quote.incident_id, parkingLocation: @quote.parkingLocation, policyExcess: @quote.policyExcess, vehicleReg: @quote.vehicleReg, windscreenCover: @quote.windscreenCover }
    end

    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should show quote" do
    get :show, id: @quote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote
    assert_response :success
  end

  test "should update quote" do
    patch :update, id: @quote, quote: { breakdownCover: @quote.breakdownCover, customer_id: @quote.customer_id, estimatedMileage: @quote.estimatedMileage, estimatedVehicleValue: @quote.estimatedVehicleValue, incident_id: @quote.incident_id, parkingLocation: @quote.parkingLocation, policyExcess: @quote.policyExcess, vehicleReg: @quote.vehicleReg, windscreenCover: @quote.windscreenCover }
    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete :destroy, id: @quote
    end

    assert_redirected_to quotes_path
  end
end
