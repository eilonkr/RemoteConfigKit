//
//  RemoteConfigService.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 10/06/2021.
//

import Foundation

/// Main service class for remote configuration management
public class RemoteConfigService {
    public static let shared = RemoteConfigService()
    
    private var remoteConfigClient: RemoteConfigClient?
    
    private init() { }

    // MARK: - Public Configuration
    
    /// Configure the service with a remote config client
    /// - Parameter client: The client to use for remote configuration
    public func configure(with client: RemoteConfigClient) {
        self.remoteConfigClient = client
    }
    
    // MARK: - Public Access
    
    /// Access remote configuration values by key
    /// - Parameter key: The configuration key
    /// - Returns: The remote configuration value, or nil if not found
    public subscript(_ key: String) -> RemoteConfigValue? {
        return remoteConfigClient?[key]
    }
    
    /// Activate remote configuration
    /// - Parameter completion: Optional completion handler
    public func activate() async throws {
        try await remoteConfigClient?.activate()
    }
} 
