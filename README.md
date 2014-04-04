# notifying-action

This Chef cookbook simplifies creading resource providers that enclose other resources and need to
notify their subscribers based on the notifications received from all or a subset of these
enclosed resources. For example, suppose you are implementing a resource that installs a service
and creates a configuration file for it. Then, you want to restart the service if either a new
version was installed, or the configuration file changed.

## Contributing

Pull requests are welcome.

## License

Apache License 2.0
