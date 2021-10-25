//
//  SuperMarioApp.swift
//  SuperMario
//
//  Created by King Copones on 10/19/21.
//

import SwiftUI

@available(iOS 15.0, *)
@main
struct SuperMarioApp: App {
    
    @StateObject var vm = StartViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
            StartView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
