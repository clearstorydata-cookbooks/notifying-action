# notifying-action

[![Build Status](https://travis-ci.org/clearstorydata-cookbooks/notifying-action.svg?branch=master)](https://travis-ci.org/clearstorydata-cookbooks/notifying-action)

This Chef cookbook simplifies creating resource providers that enclose other resources and need to
notify their subscribers based on the notifications received from all or a subset of these
enclosed resources.

Opscode Community page: http://community.opscode.com/cookbooks/notifying-action

## Example

Suppose you are implementing a resource that installs a service
and creates a configuration file for it. Then, you want to restart the service if either a new
version was installed, or the configuration file changed.

In your `providers/package_and_conf.rb` you would have:

```ruby
action :install do
  notifying_action_wrapper do
    package 'my_service' do
      action :install
    end

    template '/etc/my_service/config.yml'
      source 'config.yml.erb'
    end
  end
end
```

You will then be able to use this LWRP in recipes as follows:

```ruby

my_cookbook_package_and_conf 'my_service' do
  action :install
  notifies :restart, 'service[my_service]', :immediately
end

service 'my_service' do
  action :nothing
end
```


## Contributing

Pull requests are welcome.

## License

Apache License 2.0
