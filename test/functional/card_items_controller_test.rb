require 'test_helper'

class CardItemsControllerTest < ActionController::TestCase
  setup do
    @card_item = card_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_item" do
    assert_difference('CardItem.count') do
      post :create, :card_item => @card_item.attributes
    end

    assert_redirected_to card_item_path(assigns(:card_item))
  end

  test "should show card_item" do
    get :show, :id => @card_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @card_item.to_param
    assert_response :success
  end

  test "should update card_item" do
    put :update, :id => @card_item.to_param, :card_item => @card_item.attributes
    assert_redirected_to card_item_path(assigns(:card_item))
  end

  test "should destroy card_item" do
    assert_difference('CardItem.count', -1) do
      delete :destroy, :id => @card_item.to_param
    end

    assert_redirected_to card_items_path
  end
end
