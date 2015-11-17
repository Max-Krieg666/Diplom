require 'test_helper'

class StudentRatingElementsControllerTest < ActionController::TestCase
  setup do
    @student_rating_element = student_rating_elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_rating_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_rating_element" do
    assert_difference('StudentRatingElement.count') do
      post :create, student_rating_element: { value: @student_rating_element.value }
    end

    assert_redirected_to student_rating_element_path(assigns(:student_rating_element))
  end

  test "should show student_rating_element" do
    get :show, id: @student_rating_element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_rating_element
    assert_response :success
  end

  test "should update student_rating_element" do
    patch :update, id: @student_rating_element, student_rating_element: { value: @student_rating_element.value }
    assert_redirected_to student_rating_element_path(assigns(:student_rating_element))
  end

  test "should destroy student_rating_element" do
    assert_difference('StudentRatingElement.count', -1) do
      delete :destroy, id: @student_rating_element
    end

    assert_redirected_to student_rating_elements_path
  end
end
