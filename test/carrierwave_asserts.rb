# https://www.sitepoint.com/creating-your-first-gem/
#
# Now in your main program you can just require your module and give it any file to parse. In Rails, we would probably put a module like this in the lib folder. You can create large module 'libraries' consisting of many nested modules and classes. Here is a more complex example module used for processing data.May 5, 2016
#
# bundle gem your_gem_name
# add code
# gem build awesome_gem.gemspec
# gem install awesome_gem.gemspec
# add this to a local rails Gemfile
#   gem 'carrierwave_asserts'





require 'minitest/assertions'
require 'rmagick'
require 'base64'

module Minitest::Assertions
include Magick


#************************888
#BROKEN

# https://github.com/seattlerb/minitest/issues/730
# https://chriskottom.com/blog/2014/08/customize-minitest-assertions-and-expectations/


def assert_permissions(uploader, permissions)
  file_permissions = (File.stat(uploader.current_path).mode & 0777).to_s(8)
  assert_equal(permissions,file_permissions)
  #assert permissions == file_permissions,
  #"Expected #{ uploader.identifier } to have permissions #{ permissions }."
  #assert uploader == permissions, "it worked"


end

  # def assert_same_items(expected, actual)
  #   assert same_items(expected, actual),
  #     "Expected #{ expected.inspect } and #{ actual.inspect } to have the same items"
  # end
  #
  # #
  # #  Fails if +expected and +actual have the same items.
  # #
  # def refute_same_items(expected, actual)
  #   refute same_items(expected, actual),
  #   "Expected #{ expected.inspect } and #{ actual.inspect } would not have the same items"
  # end
  #
  # private
  #
  # def same_items(expected, actual)
  #   actual.is_a?(Enumerable) && expected.is_a?(Enumerable) &&
  #   expected.count == actual.count && actual.all? { |e| expected.include?(e) }
  # end
  #end
end
