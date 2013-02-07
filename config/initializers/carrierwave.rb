CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                                      # required
    :aws_access_key_id      => 'AKIAJJNMLLRSRLIKPF6Q',                     # required
    :aws_secret_access_key  => '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', # required
    :region                 => 'sa-east-1',                                # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'higheffects'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end