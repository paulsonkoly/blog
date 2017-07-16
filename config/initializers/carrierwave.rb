CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider='fog/dropbox'
    config.fog_credentials = {
      provider: 'Dropbox',
      dropbox_oauth2_access_token: ENV['DROPBOX_OAUTH2_ACCESS_TOKEN']
    }
  else
    config.storage = :file
  end
end
