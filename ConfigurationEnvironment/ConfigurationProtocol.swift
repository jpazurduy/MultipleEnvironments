//
//  ConfigurationProtocol.swift
//  MultipleEnvironments1
//
//  Created by Jorge Azurduy on 7/4/25.
//
import Foundation

protocol ConfigurationProtocol {
    var apiBaseURL: String { get }
    var isLoggingEnabled: Bool { get }
    var analyticsKey: String { get }
    var isDebugMenuEnabled: Bool { get }
    var environmentName: String { get }
    
    // Network settings
    var apiTimeout: TimeInterval { get }
    var maxRetryAttempts: Int { get }
    
    // Feature flags
    var isFeatureXEnabled: Bool { get }
    var isBetaFeaturesEnabled: Bool { get }
}
