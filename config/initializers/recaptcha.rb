Recaptcha.configure do |config|
  config.site_key = ENV["RECAPTCHA_SITE"]
  config.secret_key = ENV["RECAPTCHA_KEY"]
end
