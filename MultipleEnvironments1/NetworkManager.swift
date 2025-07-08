//
//  NetworkManager.swift
//  MultipleEnvironments1
//
//  Created by Jorge Azurduy on 7/5/25.
//

struct NetworkManager {
    
    let apiURL: String?
    
    
    init() {
        self.apiURL = ConfigurationManager.shared.apiURL
    }
}
