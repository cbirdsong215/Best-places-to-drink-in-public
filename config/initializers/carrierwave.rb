CarrierWave.configure do |config|
  # Hacky fix for exception - translation missing: en.errors.messages.extension_whitelist_error
  carrierwave_gem = Bundler.rubygems.find_name('carrierwave').first
  I18n.load_path.prepend(File.join(carrierwave_gem.full_gem_path, 'lib', 'carrierwave', 'locale', "en.yml")) if carrierwave_gem.present?

  if Rails.env.production? || Rails.env.development?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      region: ENV['S3_REGION']
    }

    config.fog_directory = ENV['S3_BUCKET']

    config.storage :fog
  else
    config.storage :file
    config.enable_processing = false
  end
end
