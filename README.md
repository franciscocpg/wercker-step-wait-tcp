# wercker-step-wait-tcp
Waits for a tcp connection to be ready

### Options

* `host` (optional) Host to listen. Defaults to localhost
* `port` (optional) Port to listen. Defaults to 8080
* `timeout` (optional) Timeout in seconds. Defaults to 60

# Example

    steps:
        - franciscocpg/step-wait-tcp:
            host: my-service-host
            port: 8080
            timeout: 10

# License

The MIT License (MIT)


# Changelog

## 0.0.1
- initial version