require 'test_helper'

class RatingElementsControllerTest < ActionController::TestCase
  setup do
    @rating_element = rating_elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_element" do
    assert_difference('RatingElement.count') do
      post :create, rating_element: { score: @rating_element.score, title: @rating_element.title }
    end

    assert_redirected_to rating_element_path(assigns(:rating_element))
  end

  test "should show rating_element" do
    get :show, id: @rating_element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_element
    assert_response :success
  end

  test "should update rating_element" do
    patch :update, id: @rating_element, rating_element: { score: @rating_element.score, title: @rating_element.title }
    assert_redirected_to rating_element_path(assigns(:rating_element))
  end

  test "should destroy rating_element" do
    assert_difference('RatingElement.count', -1) do
      delete :destroy, id: @rating_element
    end

    assert_redirected_to rating_elements_path
  end
end
