require 'test_helper'

class LinesItemsControllerTest < ActionController::TestCase
  setup do
    @lines_item = lines_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lines_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lines_item" do
    assert_difference('LinesItem.count') do
      post :create, lines_item: { cart_id: @lines_item.cart_id, item_id: @lines_item.item_id, quantity: @lines_item.quantity, unit_price: @lines_item.unit_price }
    end

    assert_redirected_to lines_item_path(assigns(:lines_item))
  end

  test "should show lines_item" do
    get :show, id: @lines_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lines_item
    assert_response :success
  end

  test "should update lines_item" do
    patch :update, id: @lines_item, lines_item: { cart_id: @lines_item.cart_id, item_id: @lines_item.item_id, quantity: @lines_item.quantity, unit_price: @lines_item.unit_price }
    assert_redirected_to lines_item_path(assigns(:lines_item))
  end

  test "should destroy lines_item" do
    assert_difference('LinesItem.count', -1) do
      delete :destroy, id: @lines_item
    end

    assert_redirected_to lines_items_path
  end
end
