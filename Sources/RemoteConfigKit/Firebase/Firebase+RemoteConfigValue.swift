//
//  Firebase+RemoteConfigValue.swift
//  RemoteConfigKit
//
//  Created by Eilon Krauthammer on 24/11/2023.
//

#if canImport(Firebase)
import Firebase

/// Extension to make Firebase's RemoteConfigValue conform to our protocol
/// Only available when Firebase is imported in the consuming project
extension Firebase.RemoteConfigValue: RemoteConfigValue {
    public var bool: Bool? {
        guard source == .remote else {
            return nil
        }
            
        return boolValue
    }
    
    public var float: Float? {
        guard source == .remote else {
            return nil
        }
        
        return numberValue.floatValue
    }
    
    public var int: Int? {
        guard source == .remote else {
            return nil
        }
        
        return numberValue.intValue
    }
    
    public var string: String? {
        guard source == .remote else {
            return nil
        }
        
        return stringValue
    }
}
#endif 