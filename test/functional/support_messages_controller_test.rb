require 'test_helper'

class SupportMessagesControllerTest < ActionController::TestCase
  setup do
    @support_message = support_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_message" do
    assert_difference('SupportMessage.count') do
      post :create, support_message: { email: @support_message.email, message: @support_message.message, title: @support_message.title }
    end

    assert_redirected_to support_message_path(assigns(:support_message))
  end

  test "should show support_message" do
    get :show, id: @support_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @support_message
    assert_response :success
  end

  test "should update support_message" do
    put :update, id: @support_message, support_message: { email: @support_message.email, message: @support_message.message, title: @support_message.title }
    assert_redirected_to support_message_path(assigns(:support_message))
  end

  test "should destroy support_message" do
    assert_difference('SupportMessage.count', -1) do
      delete :destroy, id: @support_message
    end

    assert_redirected_to support_messages_path
  end
end
