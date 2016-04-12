Devise.setup do |config|
    config.mailer_sender = 'blog@mail.com'

  # config.mailer = 'Devise::Mailer'

  require 'devise/orm/active_record'

  config.authentication_keys = [:username]

  # config.request_keys = []

  config.case_insensitive_keys = [:email, :username]

  config.strip_whitespace_keys = [:email, :username]

  # config.params_authenticatable = true

  # config.http_authenticatable = false

  # config.http_authenticatable_on_xhr = true

  # config.http_authentication_realm = 'Application'

  # config.paranoid = true

  config.skip_session_storage = [:http_auth]

  # config.clean_up_csrf_token_on_authentication = true

  config.stretches = Rails.env.test? ? 1 : 10

  # config.pepper = 'b99c8056a42f2d9f276bb2da43a768b60a32106b5e03af617bc988e3265b034b0d3091fcb515cd323731d3a40e5658349e03f458da868e065460dcaf22348800'

  # config.send_password_change_notification = false

  config.reconfirmable = false

  # config.confirmation_keys = [:email]

  config.expire_all_remember_me_on_sign_out = true

  # config.extend_remember_period = false

  # config.rememberable_options = {}

  config.password_length = 4..72

  config.email_regexp = /\A[^@]+@[^@]+\z/

  # config.unlock_keys = [:email]

  # config.maximum_attempts = 20

  # config.unlock_in = 1.hour

  # config.last_attempt_warning = true
 
  # config.reset_password_keys = [:email]

  config.reset_password_within = 6.hours

  # config.sign_in_after_reset_password = true

  # config.encryptor = :sha512

  # config.scoped_views = false

  # config.default_scope = :user

  # config.sign_out_all_scopes = true

  # config.navigational_formats = ['*/*', :html]

  config.sign_out_via = :delete

  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # config.router_name = :my_engine

  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
