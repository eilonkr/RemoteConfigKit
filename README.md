# RemoteConfigKit

A Swift package for remote configuration management with built-in support for Firebase Remote Config and extensibility for other providers.

## Features

- 🚀 **Protocol-oriented design** for easy extensibility
- 🔥 **Optional Firebase Remote Config support** (no required dependencies)
- 🏷️ **Property wrapper syntax** for clean feature flag definitions
- 🎯 **Type-safe configuration** with automatic type conversion
- 🧪 **Testable architecture** with dependency injection support
- 📱 **Multi-platform support** (iOS, macOS, tvOS, watchOS)

## Installation

### Swift Package Manager

Add RemoteConfigKit to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/RemoteConfigKit", from: "1.0.0")
]
```

**Note**: RemoteConfigKit has no required dependencies. Firebase support is optional and only available when Firebase is already added to your project.

## Usage

### 1. Configure the Service

First, configure the `RemoteConfigService` with a client implementation:

#### Using Firebase (Optional)

If you have Firebase in your project, you can use the built-in Firebase support:

```swift
import RemoteConfigKit
import Firebase

// In your app initialization (e.g., AppDelegate or App struct)
FirebaseApp.configure()

let firebaseClient = FirebaseRemoteConfigService()
RemoteConfigService.shared.configure(with: firebaseClient)
RemoteConfigService.shared.activate()
```

#### Using a Custom Implementation

You can also implement your own remote config client:

```swift
import RemoteConfigKit

class MyRemoteConfigClient: RemoteConfigClient {
    subscript(key: String) -> RemoteConfigValue? {
        // Your implementation here
        return nil
    }
    
    func activate(completion: (() -> Void)?) {
        // Your activation logic here
        completion?()
    }
}

let customClient = MyRemoteConfigClient()
RemoteConfigService.shared.configure(with: customClient)
RemoteConfigService.shared.activate()
```

### 2. Define Feature Flags

Create your feature flags using the `@FeatureFlag` property wrapper:

```swift
import RemoteConfigKit

class FeatureFlags {
    @FeatureFlag("enableNewFeature", defaultValue: false) 
    static var enableNewFeature: Bool
    
    @FeatureFlag("maxRetryCount", defaultValue: 3) 
    static var maxRetryCount: Int
    
    @FeatureFlag("serverBaseURL", defaultValue: "https://api.example.com") 
    static var serverBaseURL: String
    
    @OptionalFeatureFlag("experimentalFeature") 
    static var experimentalFeature: Bool?
}
```

### 3. Use Feature Flags in Your Code

```swift
if FeatureFlags.enableNewFeature {
    // Show new feature
} else {
    // Show old feature
}

let retryCount = FeatureFlags.maxRetryCount
let baseURL = FeatureFlags.serverBaseURL
```

## Supported Types

RemoteConfigKit supports the following types out of the box:

- `Bool`
- `Int`
- `Float`
- `String`

You can extend support to custom types by conforming to `RemoteConfigConvertible`:

```swift
extension MyCustomType: RemoteConfigConvertible {
    static func value(for remoteConfigValue: RemoteConfigValue) -> MyCustomType? {
        // Your conversion logic here
        return nil
    }
}
```

## Architecture

The package is built with a protocol-oriented architecture:

- **`RemoteConfigClient`**: Protocol for remote config providers
- **`RemoteConfigValue`**: Protocol for configuration values
- **`RemoteConfigService`**: Main service class (singleton)
- **`FeatureFlag`**: Property wrapper for feature flags with defaults
- **`OptionalFeatureFlag`**: Property wrapper for optional feature flags

## Custom Implementations

You can create custom remote config clients by conforming to `RemoteConfigClient`:

```swift
class MyCustomRemoteConfigClient: RemoteConfigClient {
    subscript(key: String) -> RemoteConfigValue? {
        // Your implementation here
        return nil
    }
    
    func activate(completion: (() -> Void)?) {
        // Your activation logic here
        completion?()
    }
}
```

## Testing

The package includes mock implementations for testing:

```swift
import XCTest
@testable import RemoteConfigKit

class MyFeatureFlagTests: XCTestCase {
    func testFeatureFlag() {
        let mockClient = MockRemoteConfigClient()
        RemoteConfigService.shared.configure(with: mockClient)
        
        @FeatureFlag("testFlag", defaultValue: false)
        var testFlag: Bool
        
        XCTAssertFalse(testFlag)
    }
}
```

## Requirements

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+
- Swift 5.9+
- Xcode 15.0+

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. 