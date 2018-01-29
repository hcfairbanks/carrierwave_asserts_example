require 'test_helper'
require 'minitest/autorun'
require 'rmagick'
require 'base64'

class PictureUploaderTest < ActiveSupport::TestCase
  include Magick

  setup do
    PictureUploader.enable_processing = true
    file_path = File.join( fixture_path, "files","imgs", "cat_1.jpeg")
    data_url  = "data:image/jpeg;base64,"
    data_url += Base64.encode64(File.open(file_path).read)
    cat = Cat.create(name: 'Mr Snuggles', picture: data_url)
    @uploader = PictureUploader.new(cat, :picture)
    File.open(file_path) { |f| @uploader.store!(f) }
  end

  test "img scales down landscape to fit within 200 by 133 pixels" do
    assert_be_no_larger_than(@uploader.current_path, 200, 133)
  end

  test "thumbnail scales down to exactly 100 by 67 pixels" do
    assert_have_dimensions(@uploader.thumb.current_path, 100, 67)
  end

  test "adds the correct permissions" do
    assert_have_permissions(@uploader.current_path,"600")
  end

  test "thumbnail is the same as the expected thumbnail file" do
    example = File.join(fixture_path,"files","example_imgs","thumb.jpeg")
    assert_identical_files(example,@uploader.thumb.current_path)
  end

  test "image is the same as the expected image file" do
    example = File.join(fixture_path,"files","example_imgs","cat_uploaded.jpeg")
    assert_identical_files(example,@uploader.current_path)
  end

  test "File is in the expected folder location" do
    assert_file_location(@uploader.current_path)
  end

  test "processes the thumbnail to the proper mb size" do
    assert_file_size(@uploader.thumb.current_path,65817)
  end

  test "processes the image to the proper mb size" do
    assert_file_size(@uploader.current_path,80467.0)
  end

  test "obfuscates the image name" do
    # Not a great test but it still only tests one thing.
    # SecureRandom.uuid creates string size 36 + 5 '.jpeg' = 41
    assert_equal(@uploader.identifier.size,41)
    assert_not_equal(@uploader.identifier,"cat_1.jpeg")
    assert_match( /\A\h{8}-\h{4}-\h{4}-\h{4}-\h{12}(.jpeg)\z/,
                  @uploader.identifier,['msg'])
  end

  test "has the correct format" do
    assert_format(@uploader.current_path,"JPEG")
  end

end
