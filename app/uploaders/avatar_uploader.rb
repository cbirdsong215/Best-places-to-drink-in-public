class AvatarUploader < CarrierWave::Uploader::Base

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url(*)
    ActionController::Base.helpers.asset_path("fallback/" +
      [version_name, "profile_default.png"].compact.join('_'))
  end

end
