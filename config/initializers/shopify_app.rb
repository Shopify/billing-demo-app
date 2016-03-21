ShopifyApp.configure do |config|
  config.api_key = ENV["BILLING_DEMO_API_KEY"]
  config.secret = ENV["BILLING_DEMO_SECRET_KEY"]
  config.redirect_uri = ENV["BILLING_DEMO_OAUTH_CALLBACK_URL"]
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
