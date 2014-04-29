CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['gear_bucket'],
    aws_secret_access_key: ENV['gear_secret_key']
    region: 'eu-west-1'
  }
  config.fog_directory  = "gear-#{Rails.env}"
end
