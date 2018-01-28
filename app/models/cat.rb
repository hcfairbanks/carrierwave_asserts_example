class Cat < ApplicationRecord

  mount_base64_uploader :picture, PictureUploader
  validates :name, presence: true
  after_destroy :remove_picture_directory

  protected

  def remove_picture_directory
    FileUtils.remove_dir(File.join(Rails.root,
                                  "public",
                                  "uploads",
                                  Rails.env,
                                  "cat",
                                  "picture",
                                  self.id.to_s), force: true)
  end

end
