# Hide the asset loading from the log
if Rails.env.development?
  Rails.application.config.middleware.insert_before Rails::Rack::Logger, DisableAssetsLogger
end
