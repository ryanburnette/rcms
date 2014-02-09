class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    process :resize_to_fit => [1024,9999]
  end

  version :medium do
    process :resize_to_fit => [800,9999]
  end

  version :small do
    process :resize_to_fit => [640,9999]
  end

  version :thumb do
    process :resize_to_fill => [125,125]
  end

end