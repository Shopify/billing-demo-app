ShopifyApp.configure do |config|
  config.application_name = 'Billing Demo App'
  config.api_key = ENV["BILLING_DEMO_API_KEY"]
  config.secret = ENV["BILLING_DEMO_SECRET_KEY"]
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
