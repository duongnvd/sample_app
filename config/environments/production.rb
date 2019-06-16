Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  config.assets.compile = false

  config.active_storage.service = :local

  # Don"t care if the mailer can"t send.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = true
  host = "sun-sample-app.herokuapp.com"
  config.action_mailer.default_url_options = { host: host, protocol: "https" }
  config.action_mailer.delivery_method = :smtp

  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
    address: "smtp.sendgrid.net",
    port: 587,
    domain: "heroku.com",
    authentication: :plain,
    enable_starttls_auto: true,
    user_name: Figaro.env.mail_username,
    password: Figaro.env.mail_password,
  }

  config.force_ssl = true

  config.log_level = :debug

  config.log_tags = [:request_id]

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
