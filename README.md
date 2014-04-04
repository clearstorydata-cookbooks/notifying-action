# notifying-action

[![Build Status](https://travis-ci.org/mbautin/chef-notifying-action.svg)](https://travis-ci.org/mbautin/chef-notifying-action)

This Chef cookbook simplifies creading resource providers that enclose other resources and need to
notify their subscribers based on the notifications received from all or a subset of these
enclosed resources.


## Example

Suppose you are implementing a resource that installs a service
and creates a configuration file for it. Then, you want to restart the service if either a new
version was installed, or the configuration file changed.

In your `providers/my_service_with_conf.rb` you would have:
```ruby
action :install do
  notifying_action_wrapper
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

my_cookbook_my_service_with_conf 'my_service1' do
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
