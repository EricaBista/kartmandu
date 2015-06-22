require 'test_helper'

class CmsControllerTest < ActionController::TestCase
  setup do
    @cm = cms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cm" do
    assert_difference('Cm.count') do
      post :create, cm: { blog: @cm.blog, cash_on_delivery: @cm.cash_on_delivery, contact_us: @cm.contact_us, free_shipping: @cm.free_shipping, help: @cm.help, need_: @cm.need_, policy: @cm.policy, privacy: @cm.privacy, terms_of_use: @cm.terms_of_use }
    end

    assert_redirected_to cm_path(assigns(:cm))
  end

  test "should show cm" do
    get :show, id: @cm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cm
    assert_response :success
  end

  test "should update cm" do
    patch :update, id: @cm, cm: { blog: @cm.blog, cash_on_delivery: @cm.cash_on_delivery, contact_us: @cm.contact_us, free_shipping: @cm.free_shipping, help: @cm.help, need_: @cm.need_, policy: @cm.policy, privacy: @cm.privacy, terms_of_use: @cm.terms_of_use }
    assert_redirected_to cm_path(assigns(:cm))
  end

  test "should destroy cm" do
    assert_difference('Cm.count', -1) do
      delete :destroy, id: @cm
    end

    assert_redirected_to cms_path
  end
end
