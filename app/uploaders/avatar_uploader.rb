class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :full do
    process :resize_to_fill => [500,500]
  end

  version :thumb do
    process :resize_to_fill => [125,125]
  end

end