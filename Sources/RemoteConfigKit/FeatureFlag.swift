//
//  FeatureFlag.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 03/11/2022.
//

import Foundation

/// Property wrapper for feature flags with default values
@propertyWrapper
public struct FeatureFlag<Value: RemoteConfigConvertible> {
    public let key: String
    public let defaultValue: Value
    
    public init(_ key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: Value {
        if let remoteConfigValue = RemoteConfigService.shared[key] {
            return Value.value(for: remoteConfigValue) ?? defaultValue
        }
        
        return defaultValue
    }
}

/// Property wrapper for optional feature flags
@propertyWrapper
public struct OptionalFeatureFlag<Value: RemoteConfigConvertible> {
    public let key: String
    
    public init(_ key: String) {
        self.key = key
    }
    
    public var wrappedValue: Value? {
        if let remoteConfigValue = RemoteConfigService.shared[key] {
            return Value.value(for: remoteConfigValue)
        }
        
        return nil
    }
} 