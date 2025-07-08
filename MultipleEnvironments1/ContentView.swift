//
//  ContentView.swift
//  MultipleEnvironments1
//
//  Created by Jorge Azurduy on 7/3/25.
//
import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            
            Button {
//                TestEnvironment.test()
                ContentViewModel().fetchData()
                
                print(ConfigurationManager.shared.environment)
            } label: {
                Text("Print Configuration")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
