require 'test_helper'

class CatTest < ActiveSupport::TestCase

  setup do
    file_path = File.join( fixture_path, "files","imgs", "cat_1.jpeg")
    file_pic = Rack::Test::UploadedFile.new(file_path)
    @cat = Cat.create( name: 'Mr Snuggles', picture: file_pic )
  end

  test "creates image in correct directory" do
    cat_img_path = File.join(Rails.root,"public","#{@cat.picture}")
    result = File.exist? File.expand_path cat_img_path
    assert(result)
  end

  test "removes the image from the directory" do
    cat_img_path = File.join(Rails.root,"public","#{@cat.picture}")
    Cat.destroy(@cat.id)
    result = File.exist? File.expand_path cat_img_path
    refute(result)
  end

end
