//
//  RemoteConfigClient.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 10/06/2021.
//

import Foundation

/// Protocol defining the interface for remote configuration clients
public protocol RemoteConfigClient {
    subscript(_ key: String) -> RemoteConfigValue? { get }
    func activate(completion: (() -> Void)?)
} 