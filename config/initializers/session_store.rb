# Be sure to restart your server when you modify this file.

#original version of line added for Redis: Rails.application.config.session_store :cookie_store, key: '_invoice_session'

# added for Redis usage
#MyApplication::Application.config.session_store :redis_store, servers: "redis://localhost:6379/0/session"
#Rails.application.config.session_store :redis_store, servers: "redis://localhost:6379/0/session"
Rails.application.config.session_store :redis_store, servers: "redis://localhost:6379/0/session"