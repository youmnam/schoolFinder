require 'test_helper'

class ItemAttachmentsControllerTest < ActionController::TestCase
  setup do
    @item_attachment = item_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_attachment" do
    assert_difference('ItemAttachment.count') do
      post :create, item_attachment: { image: @item_attachment.image, item_id: @item_attachment.item_id }
    end

    assert_redirected_to item_attachment_path(assigns(:item_attachment))
  end

  test "should show item_attachment" do
    get :show, id: @item_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_attachment
    assert_response :success
  end

  test "should update item_attachment" do
    patch :update, id: @item_attachment, item_attachment: { image: @item_attachment.image, item_id: @item_attachment.item_id }
    assert_redirected_to item_attachment_path(assigns(:item_attachment))
  end

  test "should destroy item_attachment" do
    assert_difference('ItemAttachment.count', -1) do
      delete :destroy, id: @item_attachment
    end

    assert_redirected_to item_attachments_path
  end
end
