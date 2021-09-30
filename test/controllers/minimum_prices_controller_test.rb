require "test_helper"

class MinimumPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minimum_price = minimum_prices(:one)
  end

  test "should get index" do
    get minimum_prices_url, as: :json
    assert_response :success
  end

  test "should create minimum_price" do
    assert_difference('MinimumPrice.count') do
      post minimum_prices_url, params: { minimum_price: { bus_operator: @minimum_price.bus_operator, date: @minimum_price.date, id_alert_price: @minimum_price.id_alert_price, price: @minimum_price.price, schedule: @minimum_price.schedule, travel_class: @minimum_price.travel_class } }, as: :json
    end

    assert_response 201
  end

  test "should show minimum_price" do
    get minimum_price_url(@minimum_price), as: :json
    assert_response :success
  end

  test "should update minimum_price" do
    patch minimum_price_url(@minimum_price), params: { minimum_price: { bus_operator: @minimum_price.bus_operator, date: @minimum_price.date, id_alert_price: @minimum_price.id_alert_price, price: @minimum_price.price, schedule: @minimum_price.schedule, travel_class: @minimum_price.travel_class } }, as: :json
    assert_response 200
  end

  test "should destroy minimum_price" do
    assert_difference('MinimumPrice.count', -1) do
      delete minimum_price_url(@minimum_price), as: :json
    end

    assert_response 204
  end
end
