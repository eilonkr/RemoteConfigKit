//
//  RemoteConfigService.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 10/06/2021.
//

import Foundation

/// Main service class for remote configuration management
final public class RemoteConfigService: @unchecked Sendable {
    public static let shared = RemoteConfigService()
    
    private var remoteConfigClient: RemoteConfigClient?
    
    private init() { }

    // MARK: - Public Access
    
    /// Access remote configuration values by key
    /// - Parameter key: The configuration key
    /// - Returns: The remote configuration value, or nil if not found
    public subscript(_ key: String) -> RemoteConfigValue? {
        return remoteConfigClient?[key]
    }
    
    /// Activate remote configuration
    /// - Parameter completion: Optional completion handler
    @MainActor public func activate(client: RemoteConfigClient) async throws {
        self.remoteConfigClient = client
        try await client.activate()
    }
} 
