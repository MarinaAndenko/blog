# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end

  version :post_avatar do
    process resize_to_fill: [200,200]
  end
  version :comment_avatar do
    process resize_to_fill: [50,50]
  end

end
