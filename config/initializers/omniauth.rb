require "google/api_client"

OmniAuth.config.logger = Rails.logger

OmniAuth.config.on_failure = Proc.new do |env|
  UsersController.action(:omniauth_failure).call(env)
end



Rails.application.config.middleware.use OmniAuth::Builder do
  @keys = YAML.load_file('./config/application.yml')
  provider :google_oauth2, @keys['GMAIL_ID'], @keys['GMAIL_SECRET'], {
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/drive https://spreadsheets.google.com/feeds/',
    client_options: {
      ssl: {
        ca_file: Rails.root.join("cacert.pem").to_s
      }
    }
  }
end