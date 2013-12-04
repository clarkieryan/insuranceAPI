require 'test_helper'

class API::V1::CustomerDetailsControllerTest < ActionController::TestCase
  setup do
    #@controller = API::V1::Customers::CustomerDetailsController.new
    @customer_detail = customer_details(:one)
  end

  test "should get index" do
    get :index, :customer_id => 980190962
    assert_response :success
    assert_not_nil assigns(:customer_details)
  end

  test "should get new" do
    get :new, :customer_id => 980190962
    assert_response :success
  end

  test "should create customer_detail" do
    assert_difference('CustomerDetail.count') do
      post :create, :customer_id =>980190962, customer_detail: { city: @customer_detail.city, county: @customer_detail.county, customer_id: @customer_detail.customer_id, dob: @customer_detail.dob, incidents: @customer_detail.incidents, licenceHeldSince: @customer_detail.licenceHeldSince, licenceType: @customer_detail.licenceType, occupation: @customer_detail.occupation, postCode: @customer_detail.postCode, quotesStored: @customer_detail.quotesStored, street: @customer_detail.street, telNumber: @customer_detail.telNumber }
    end

    assert_redirected_to customer_detail_path(assigns(:customer_detail))
  end

  test "should show customer_detail" do
    get :show, id: @customer_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_detail
    assert_response :success
  end

  test "should update customer_detail" do
    patch :update, id: @customer_detail, customer_detail: { city: @customer_detail.city, county: @customer_detail.county, customerID: @customer_detail.customerID, dob: @customer_detail.dob, incidents: @customer_detail.incidents, licenceHeldSince: @customer_detail.licenceHeldSince, licenceType: @customer_detail.licenceType, occupation: @customer_detail.occupation, postCode: @customer_detail.postCode, quotesStored: @customer_detail.quotesStored, street: @customer_detail.street, telNumber: @customer_detail.telNumber }
    assert_redirected_to customer_detail_path(assigns(:customer_detail))
  end

  test "should destroy customer_detail" do
    assert_difference('CustomerDetail.count', -1) do
      delete :destroy, id: @customer_detail
    end

    assert_redirected_to customer_details_path
  end
end
