CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['gear_bucket'],
    aws_secret_access_key: ENV['gear_secret_key']
  }
  config.fog_directory  = "gearx-#{Rails.env}"
end
