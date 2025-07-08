//
//  ConfigurationManager.swift
//  MultipleEnvironments1
//
//  Created by Jorge Azurduy on 7/4/25.
//

import Foundation

final class ConfigurationManager: ObservableObject {
    
    // MARK: - Singleton
    static let shared = ConfigurationManager()
    private init() {}
    
    // MARK: - Current Configuration
    private(set) lazy var current: ConfigurationProtocol = {
        #if DEV_ENVIRONMENT
        return DevelopmentConfiguration()
        #elseif STAGING_ENVIRONMENT
        return StagingConfiguration()
        #else
        return ProductionConfiguration()
        #endif
    }()
    
    // MARK: - Override for Testing
    func setConfiguration(_ configuration: ConfigurationProtocol) {
        current = configuration
    }
    
    // MARK: - Reset to Default
    func resetToDefault() {
        #if DEV_ENVIRONMENT
        current = DevelopmentConfiguration()
        #elseif STAGING_ENVIRONMENT
        current = StagingConfiguration()
        #else
        current = ProductionConfiguration()
        #endif
    }
    
    // MARK: - Convenience Methods
    var isDebugEnvironment: Bool {
        #if DEV_ENVIRONMENT
        return true
        #else
        return false
        #endif
    }
    
    var isProductionEnvironment: Bool {
        #if PROD_ENVIRONMENT
        return true
        #else
        return false
        #endif
    }
}

// MARK: - Easy Access Extensions
extension ConfigurationManager {
    
    // Quick access to common settings
    var apiURL: String { current.apiBaseURL }
    var shouldLog: Bool { current.isLoggingEnabled }
    var environment: String { current.environmentName }
    
    // URL creation helper
    func apiURL(for endpoint: String) -> URL? {
        URL(string: current.apiBaseURL + endpoint)
    }
    
    // Logging helper
    func log(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        guard current.isLoggingEnabled else { return }
        let fileName = (file as NSString).lastPathComponent
        print("🐛 [\(fileName):\(line)] \(function): \(message)")
    }
}

// MARK: - SwiftUI Preview Helper
#if DEBUG
extension ConfigurationManager {
    static var preview: ConfigurationManager {
        let manager = ConfigurationManager()
        manager.setConfiguration(DevelopmentConfiguration())
        return manager
    }
}
#endif
