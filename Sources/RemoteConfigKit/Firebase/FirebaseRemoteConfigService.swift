//
//  FirebaseRemoteConfigService.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 23/11/2023.
//

#if canImport(Firebase)
import Firebase

/// Firebase implementation of RemoteConfigClient
/// Only available when Firebase is imported in the consuming project
public class FirebaseRemoteConfigService: RemoteConfigClient {
    private lazy var remoteConfig: RemoteConfig = {
        let settings = RemoteConfigSettings()
        #if DEBUG
        settings.minimumFetchInterval = 0.0
        #endif
        
        let config = RemoteConfig.remoteConfig()
        config.configSettings = settings
        return config
    }()
    
    public init() {}
    
    public subscript(key: String) -> RemoteConfigValue? {
        return remoteConfig[key]
    }
    
    public func activate(completion: (() -> Void)?) {
        remoteConfig.fetchAndActivate { _, _ in
            completion?()
        }
    }
}
#endif 
