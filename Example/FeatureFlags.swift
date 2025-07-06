//
//  FeatureFlags.swift
//  Example Client Implementation
//
//  This file shows how to use RemoteConfigKit in your app
//

import RemoteConfigKit

/// Example implementation of feature flags using RemoteConfigKit
/// This would be your client-side implementation
class FeatureFlags {
    @FeatureFlag("onboardingCloseButtonShowDuration", defaultValue: 1) 
    static var onboardingCloseButtonShowDuration: Int
    
    @FeatureFlag("requestReviewSavesThreshold", defaultValue: 2) 
    static var requestReviewSavesThreshold: Int
    
    @FeatureFlag("enableRatingRequestAfterOnboarding", defaultValue: true) 
    static var enableRatingRequestAfterOnboarding: Bool
    
    @FeatureFlag("serverBaseURL", defaultValue: "https://profile-studio-29dd843971b8.herokuapp.com/api") 
    static var serverBaseURL: String
    
    @FeatureFlag("offerFreeCredit", defaultValue: false) 
    static var offerFreeCredit: Bool
    
    @FeatureFlag("enablePromoCodes", defaultValue: false) 
    static var enablePromoCodes: Bool
    
    @FeatureFlag("requestReviewInCreditPopup", defaultValue: true) 
    static var requestReviewInCreditPopup: Bool
}

// MARK: - App Configuration Example

/*
 In your app initialization (e.g., AppDelegate or SwiftUI App):
 
 import RemoteConfigKit
 
 class AppDelegate: UIApplicationDelegate {
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         
         // Option 1: Using Firebase (if available)
         #if canImport(Firebase)
         import Firebase
         FirebaseApp.configure()
         let firebaseClient = FirebaseRemoteConfigService()
         RemoteConfigService.shared.configure(with: firebaseClient)
         #else
         // Option 2: Using a custom implementation
         let customClient = MyCustomRemoteConfigClient()
         RemoteConfigService.shared.configure(with: customClient)
         #endif
         
         RemoteConfigService.shared.activate {
             print("Remote config activated")
         }
         
         return true
     }
 }
 
 // Usage in your app:
 if FeatureFlags.enablePromoCodes {
     // Show promo code functionality
 }
 
 let threshold = FeatureFlags.requestReviewSavesThreshold
 let baseURL = FeatureFlags.serverBaseURL
 */ 