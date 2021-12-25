//
//  alarmaApp.swift
//  alarma
//
//  Created by Alexey Gerasimov on 28.10.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct alarmaApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let authViewModel = AuthViewModel()
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}
