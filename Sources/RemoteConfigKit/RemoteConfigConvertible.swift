//
//  RemoteConfigConvertible.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 03/11/2022.
//

import Foundation

/// Protocol for types that can be converted from remote configuration values
public protocol RemoteConfigConvertible {
    static func value(for remoteConfigValue: RemoteConfigValue) -> Self?
}

// MARK: - Basic Type Extensions

extension Bool: RemoteConfigConvertible {
    public static func value(for remoteConfigValue: RemoteConfigValue) -> Bool? {
        return remoteConfigValue.bool
    }
}

extension Int: RemoteConfigConvertible {
    public static func value(for remoteConfigValue: RemoteConfigValue) -> Int? {
        return remoteConfigValue.int
    }
}

extension String: RemoteConfigConvertible {
    public static func value(for remoteConfigValue: RemoteConfigValue) -> String? {
        return remoteConfigValue.string
    }
}

extension Float: RemoteConfigConvertible {
    public static func value(for remoteConfigValue: RemoteConfigValue) -> Float? {
        return remoteConfigValue.float
    }
} 