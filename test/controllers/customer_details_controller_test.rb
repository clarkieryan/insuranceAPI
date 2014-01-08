require 'test_helper'

class API::V1::CustomerDetailsControllerTest < ActionController::TestCase
  setup do
    @controller = API::V1::CustomerDetailsController.new
    @customer_detail = customer_details(:one)
  end

  test "should get index" do
    get :index, :customer_id => 980190962, :format => :json
    assert_response :success
  end

  test "should create customer_detail" do

      @customer_detailz = { city: @customer_detail.city, county: @customer_detail.county, customer_id: @customer_detail.customer_id, dob: @customer_detail.dob, incidents: @customer_detail.incidents, licenceHeldSince: @customer_detail.licenceHeldSince, licenceType: @customer_detail.licenceType, occupation: @customer_detail.occupation, postCode: @customer_detail.postCode, quotesStored: @customer_detail.quotesStored, street: @customer_detail.street, telNumber: @customer_detail.telNumber }
      post :create, :customer_id =>980190962, customer_detail: @customer_detailz , :format => :json

     assert_response :success
  end

end
