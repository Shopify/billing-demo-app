ShopifyApp.configure do |config|
  config.application_name = 'Billing Demo App'
  config.api_key = ENV["BILLING_DEMO_API_KEY"]
  config.secret = ENV["BILLING_DEMO_SECRET_KEY"]
  config.myshopify_domain = 'myshopify.io'
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end

ShopifyAPI::Session.myshopify_domain = ShopifyApp.configuration.myshopify_domain
