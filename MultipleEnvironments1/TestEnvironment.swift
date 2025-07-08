//
//  TestEnvironment.swift
//  MultipleEnvironments1
//
//  Created by Jorge Azurduy on 7/3/25.
//

import Foundation

struct TestEnvironment {
    
    static func test() {
        // Quick test - add this to your ContentView or ViewController
        print("🌍 Environment: \(EnvironmentConfig.environmentName)")
        print("🔗 API URL: \(EnvironmentConfig.apiBaseURL)")
        print("📝 Logging: \(EnvironmentConfig.isLoggingEnabled)")
    }
}
