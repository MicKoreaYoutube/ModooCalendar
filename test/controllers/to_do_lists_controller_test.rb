require 'test_helper'

class ToDoListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @to_do_list = to_do_lists(:one)
  end

  test "should get index" do
    get to_do_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_to_do_list_url
    assert_response :success
  end

  test "should create to_do_list" do
    assert_difference('ToDoList.count') do
      post to_do_lists_url, params: { to_do_list: { date: @to_do_list.date, user: @to_do_list.user, work: @to_do_list.work } }
    end

    assert_redirected_to to_do_list_url(ToDoList.last)
  end

  test "should show to_do_list" do
    get to_do_list_url(@to_do_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_to_do_list_url(@to_do_list)
    assert_response :success
  end

  test "should update to_do_list" do
    patch to_do_list_url(@to_do_list), params: { to_do_list: { date: @to_do_list.date, user: @to_do_list.user, work: @to_do_list.work } }
    assert_redirected_to to_do_list_url(@to_do_list)
  end

  test "should destroy to_do_list" do
    assert_difference('ToDoList.count', -1) do
      delete to_do_list_url(@to_do_list)
    end

    assert_redirected_to to_do_lists_url
  end
end
