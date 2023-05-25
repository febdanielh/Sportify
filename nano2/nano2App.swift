//
//  nano2App.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import SwiftUI
import UserNotifications

@main
struct nano2App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
