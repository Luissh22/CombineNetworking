# CombineNetworking

Swift package providing convenience methods for using Combine for Networking

### Protocols 
**RequestProviding**: Implementors of this protocol must provide a **URLRequest** object. This object is responsible for setting the URL and HTTP method of the request.

Ideally, using an enum called **Endpoint** which implements **RequestProviding** that returns a **URLRequest** object based on each enum case.

**Networking**: Implementors will provide an implementation for the execute method that returns an **AnyPublisher**. The **AnyPublisher** is what clients will subscribe to using the **sink** method.

**APISession**: Concrete implementation of **Networking** that uses a shared **URLSession** instance and creates a data task publisher. It handles decoding the request and any errors will propagate to the downstream subscriber.
