//
//  RemoteConfigValue.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 22/11/2023.
//

import Foundation

/// Protocol defining the interface for remote configuration values
public protocol RemoteConfigValue {
    var string: String? { get }
    var bool: Bool? { get }
    var float: Float? { get }
    var int: Int? { get }
} 