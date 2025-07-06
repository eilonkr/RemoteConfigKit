//
//  RemoteConfigKit.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 24/11/2023.
//

import Foundation

/// RemoteConfigKit - A Swift package for remote configuration management
/// 
/// This package provides a flexible and protocol-oriented approach to remote configuration,
/// with built-in support for Firebase Remote Config and extensibility for other providers.
///
/// ## Usage
/// 
/// 1. Configure the service with a client:
/// ```swift
/// import RemoteConfigKit
/// 
/// let firebaseClient = FirebaseRemoteConfigService()
/// RemoteConfigService.shared.configure(with: firebaseClient)
/// RemoteConfigService.shared.activate()
/// ```
/// 
/// 2. Use feature flags in your code:
/// ```swift
/// class FeatureFlags {
///     @FeatureFlag("enableNewFeature", defaultValue: false) 
///     static var enableNewFeature: Bool
/// }
/// ```

// All public interfaces are automatically exported through their respective files 