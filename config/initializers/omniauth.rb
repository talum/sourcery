OmniAuth.config.logger = Rails.logger



Rails.application.config.middleware.use OmniAuth::Builder do
  @keys = YAML.load_file('./config/application.yml')
  provider :google_oauth2, @keys['GMAIL_ID'], @keys['GMAIL_SECRET'], {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

