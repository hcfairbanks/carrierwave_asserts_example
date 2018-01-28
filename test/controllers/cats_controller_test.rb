require 'test_helper'

class CatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat = cats(:one)
  end

  test "should get index" do
    get cats_url
    assert_response :success
  end

  test "should get new" do
    get new_cat_url
    assert_response :success
  end

  test "should create cat" do
    assert_difference('Cat.count') do
      post cats_url, params: { cat: { name: @cat.name, picture: @cat.picture } }
    end

    assert_redirected_to cat_url(Cat.last)
  end

  test "should show cat" do
    get cat_url(@cat)
    assert_response :success
  end

  test "should get edit" do
    get edit_cat_url(@cat)
    assert_response :success
  end

  test "should update cat" do
    patch cat_url(@cat), params: { cat: { name: @cat.name, picture: @cat.picture } }
    assert_redirected_to cat_url(@cat)
  end

  test "should destroy cat" do
    assert_difference('Cat.count', -1) do
      delete cat_url(@cat)
    end

    assert_redirected_to cats_url
  end
end



# require 'test_helper'
#
# class CatsControllerTest < ActionDispatch::IntegrationTest
#
#   file_path = File.join( Rails.root,
#                          "test",
#                          "fixtures",
#                          "files",
#                          "cat_images",
#                          "cat_1.jpeg")
#
#   data_url  = "data:image/jpeg;base64,"
#   data_url += Base64.encode64(File.open(file_path).read)
#
#   setup do
#     @cat = Cat.create!(name: "Mr. Fluffy Bottom", picture: data_url)
#     @cat.save!
#   end
#
#   test "should get index" do
#     get cats_url
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_cat_url
#     assert_response :success
#   end
#
#   test "should create cat" do
#     assert_difference('Cat.count') do
#       post cats_url, params: { cat: { name: @cat.name, picture: @cat.picture } }
#     end
#     assert_redirected_to cat_url(Cat.last)
#   end
#
#   test "creates a file" do
#     post cats_url, params: { cat: { name: @cat.name, picture: @cat.picture } }
#     created_file_path = File.join(Rails.root,
#                                   "public","#{assigns(:cat).picture}")
#     result = File.exist? File.expand_path created_file_path
#     assert(result)
#   end
#
#   test "should show cat" do
#     get cat_url(@cat)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_cat_url(@cat)
#     assert_response :success
#   end
#
#   test "should update cat" do
#     file_path = File.join( Rails.root,
#                            "test",
#                            "fixtures",
#                            "files",
#                            "cat_images",
#                            "cat_2.jpeg")
#
#     data_url  = "data:image/jpeg;base64,"
#     data_url += Base64.encode64(File.open(file_path).read)
#
#     patch cat_url(@cat), params: { cat: { name: "Mr Snuggles", picture: data_url } }
#     assert_redirected_to cat_url(@cat)
#     assert(assigns(:cat).valid?)
#     assert_equal([],assigns(:cat).errors.full_messages)
#   end
#
#   test "should destroy cat" do
#     assert_difference('Cat.count', -1) do
#       delete cat_url(@cat)
#     end
#
#     assert_redirected_to cats_url
#   end
# end
