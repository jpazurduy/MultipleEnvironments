//
//  ContentViewModel.swift
//  MultipleEnvironments1
//
//  Created by Jorge Azurduy on 7/5/25.
//

class ContentViewModel {
    
    let networkManager = NetworkManager()
    
    func fetchData() {
        print(networkManager.apiURL)
    }
}
