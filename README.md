# Billing Test App

This is a demo app that showcases [Shopify's Billing API](https://docs.shopify.com/api/guides/charging-for-your-app). It's meant to be used by Shopify partners and developers to learn how to interact with the Billing API, and to discover new billing features.

Here's what you can do in this demo:

- Create one-time charges.
- Create recurring charges.
- Create usage-based charges.

## Usage

  You can install the demo from [here](http://billing.shopifyapps.com/)

### Getting Started
  
  1. Go to http://billing.shopifyapps.com/
  2. Type in your test store's domain (E.g. your-store.myshopify.com), then click "Install".
  3. Click on the type of charge you want to create.
  4. Fill in the fields, and submit the form.
  
Note: Creating a recurring charge for usage charges will delete a regular recurring application charge if you have one, and vice versa. 


## Development

### Requirements

  This is built using Ruby 2.1.6, Ruby on Rails, the [Shopify App gem](https://github.com/Shopify/shopify_app), and the [Shopify API gem](https://github.com/Shopify/shopify_api). You'll need a basic Ruby on Rails development environment, and a [Shopify Partner account](https://www.shopify.com/partners).

  The Shopify admin requires all apps to use HTTPS. This can be awkward to configure when developing your app, so we recommend using a service that will tunnel HTTPS requests from a public URL into your app such as:

  - [ngrok](https://ngrok.com/)
  - [localtunnel](https://localtunnel.me/)

  The setup instructions will assume that you're using [ngrok](https://ngrok.com/).

### Setup

Here are instructions to begin developing with this demo app.

#### Create an application in your Shopify Partner account

1. Login to your [Shopify Partner account](https://www.shopify.com/partners).

2. Go to the Apps page in your Partner admin.

3. Create a new application by clicking "Create a new app" in the top-right corner. Use the following settings when filling in the fields:

  - Embedded settings: Enabled
  - Application URL: If you're running this demo app on your own computer, you probably want https://your-app.ngrok.io . Otherwise, it must be the full URL to your app.
  - Redirection URL: If you're running this demo app on your own computer, you probably want https://your-app.ngrok.io/auth/shopify/callback . Otherwise, it must be your app's OAuth callback URL.

4. Click on "Show secret", and keep this browser tab open. You'll need the API key and secret token later.
  
#### Installation

  1. Clone this Git repository, then enter its directory.

  2. Run the command `bin/setup`

  3. In the file `.env` , replace the example values with the details from your Partner application.

  4. Start the web server by running `bundle exec rails server`

  5. In a web browser, go to the Rails server. If you're running this demo app on your own computer, the URL will probably be https://your-app.ngrok.io


### Documentation

- [Shopify API](https://docs.shopify.com/api)
- [Shopify Embedded App SDK](https://docs.shopify.com/api/sdks/embedded-app-sdk)
- [Shopify Partners](https://docs.shopify.com/partners)

## Copyright

Copyright (c) 2012 "Shopify inc.". See LICENSE for details.
