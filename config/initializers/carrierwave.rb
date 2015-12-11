
# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  # # config.fog_credentials = {
  #   :provider               => 'AWS',                        # required
  #   :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],                        # required
  #   :aws_secret_access_key  => ENV["AWS_SECRET_KEY"]                         # required
  # }
  # config.fog_directory  = ENV["AWS_BUCKET"]                     # required

  config.storage    = :aws
  config.aws_bucket = ENV['AWS_BUCKET']
  config.aws_acl    = 'public-read'

  # Optionally define an asset host for configurations that are fronted by a
  # content host, such as CloudFront.
  # config.asset_host = 'http://example.com'

  # The maximum period for authenticated_urls is only 7 days.
  # config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  # config.aws_attributes = {
  #   expires: 1.week.from_now.httpdate,
  #   cache_control: 'max-age=604800'
  # }

  config.aws_credentials = {
    access_key_id:     ENV['AWS_ACCESS_KEY'],
    secret_access_key: ENV['AWS_SECRET_KEY'],
    region:            ENV['AWS_REGION'] # Required
  }

  # Optional: Signing of download urls, e.g. for serving private
  # content through CloudFront.
  # config.aws_signer = -> (unsigned_url, options) { Aws::CF::Signer.sign_url unsigned_url, options }



end