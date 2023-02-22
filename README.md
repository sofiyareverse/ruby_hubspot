## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ruby_hubspot

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ruby_hubspot

## Hubspot Configuration

This gem uses project access token only. To find the appropriate values for either approach, please visit the HubSpot API Authentication docs: https://developers.hubspot.com/docs/api/oauth/tokens.

So, to start just add your token:
```ruby
hubspot = Hubspot.new(access_token: <ACCESS_TOKEN>)
```

Or you can change access_token param if you need it by some reason:
```ruby
hubspot.access_token = <ACCESS_TOKEN>
```

We recommend using <ACCESS_TOKEN> with private apps because:
Hubspot API is currently transitioning its API authentication from API keys to private apps. From November 30, 2022, you will no longer be able to use HubSpot API keys as an authentication method to access HubSpot APIs. Instead, you'll need to use a private app access token or OAuth to authenticate API calls.
For more information please read these:
https://developers.hubspot.com/docs/api/private-apps
https://developers.hubspot.com/docs/api/migrate-an-api-key-integration-to-a-private-app

## Hubspot Requests

There are too many versions of HubSpot endpoints. That is why we decided to make requests more flexible for now.

To get some endpoint you should know a path and a method you would like to use, please visit the HubSpot API docs: https://legacydocs.hubspot.com/docs/overview.

```ruby
hubspot.request(:get, 'crm/v3/objects/contacts')

hubspot.request(:post, 'contacts/v1/contact/createOrUpdate/email/jordy@test.com', first_name: 'jordy')
```

Note, that if you try to call hubspot without initializing, like:
```ruby
Hubspot.request
```
you will get NoMethodError.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sofiyareverse/ruby_hubspot.
