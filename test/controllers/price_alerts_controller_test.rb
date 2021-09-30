require "test_helper"

class PriceAlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_alert = price_alerts(:one)
  end

  test "should get index" do
    get price_alerts_url, as: :json
    assert_response :success
  end

  test "should create price_alert" do
    assert_difference('PriceAlert.count') do
      post price_alerts_url, params: { price_alert: { destiny: @price_alert.destiny, name: @price_alert.name, origin: @price_alert.origin, price: @price_alert.price, travelClass: @price_alert.travelClass } }, as: :json
    end

    assert_response 201
  end

  test "should show price_alert" do
    get price_alert_url(@price_alert), as: :json
    assert_response :success
  end

  test "should update price_alert" do
    patch price_alert_url(@price_alert), params: { price_alert: { destiny: @price_alert.destiny, name: @price_alert.name, origin: @price_alert.origin, price: @price_alert.price, travelClass: @price_alert.travelClass } }, as: :json
    assert_response 200
  end

  test "should destroy price_alert" do
    assert_difference('PriceAlert.count', -1) do
      delete price_alert_url(@price_alert), as: :json
    end

    assert_response 204
  end
end
