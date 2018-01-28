class PictureUploader < CarrierWave::Uploader::Base
  permissions 0600

  include CarrierWave::RMagick
  storage :file

  def store_dir
    File.join(Rails.root,"public","uploads",Rails.env,"#{model.class.to_s.underscore}", "#{mounted_as}", model.id.to_s)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

  process :resize_to_fit => [200, 300]

  version :thumb do
    process resize_to_fit: [100,100]
  end

end
