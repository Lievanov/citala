OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '467263913176-6sdjrcd1vcm6nqo2sne4v1bjlkahurlr.apps.googleusercontent.com', 'Lhn5261x2b94xWz8ssvH8UHu', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  #provider :google_oauth2, ENV["467263913176-6sdjrcd1vcm6nqo2sne4v1bjlkahurlr.apps.googleusercontent.com"], ENV["sj3gezkF_Lrs46tSGRTRQJsy"],
  #  {
  #    :name => "google",
  #    :scope => "email, profile, plus.me, http://gdata.youtube.com",
  #    :prompt => "select_account",
  #    :image_aspect_ratio => "square",
  #    :image_size => 50
  #  }
end