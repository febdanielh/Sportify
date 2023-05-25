//
//  ContentView.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import MapKit
import SwiftUI
import UserNotifications

enum DisplayScreen{
    case viewDepan
    case viewIsi
    case viewMe
}

struct ContentView: View {
    
    @State var currentDisplayScreen: DisplayScreen = .viewDepan
    @State var selectedInterests: [String] = []
    @State var unSelectedInterests: [String] = []
    
    @State var futsalSelected = false
    @State var badmintonSelected = false
    @State var caturSelected = false
    @State var minSocSelected = false
    @State var billiardSelected = false
    @State var basketSelected = false
    
    @State var username: String = ""
    @State var description: String = ""
    
    @State var buttonClicked = false
    
    var body: some View {
        switch currentDisplayScreen{
        case .viewDepan:
            WelcomeView(username: $username,
                        description: $description,
                        currentDisplayScreen: $currentDisplayScreen,
                        selectedInterests: $selectedInterests,
                        unSelectedInterests: $unSelectedInterests,
                        futsalSelected: $futsalSelected,
                        badmintonSelected: $badmintonSelected,
                        caturSelected: $caturSelected,
                        minSocSelected: $minSocSelected,
                        basketSelected: $basketSelected,
                        billiardSelected: $billiardSelected)
        case .viewIsi:
            PickerView(currentDisplayScreen: $currentDisplayScreen,
                       selectedInterests: $selectedInterests,
                       unSelectedInterests: $unSelectedInterests,
                       futsalSelected: $futsalSelected,
                       badmintonSelected: $badmintonSelected,
                       caturSelected: $caturSelected,
                       minSocSelected: $minSocSelected,
                       basketSelected: $basketSelected,
                       billiardSelected: $billiardSelected,
                       username: $username,
                       description: $description,
                       buttonClicked: $buttonClicked
            )
        case .viewMe:
            MeView(selectedInterests: $selectedInterests,
                   unSelectedInterests: $unSelectedInterests,
                   futsalSelected: $futsalSelected,
                   badmintonSelected: $badmintonSelected,
                   caturSelected: $caturSelected,
                   minSocSelected: $minSocSelected,
                   basketSelected: $basketSelected,
                   billiardSelected: $billiardSelected,
                   username: $username,
                   description: $description,
                   buttonClikced: $buttonClicked
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if let error = error {
            // Handle error
            print("Error requesting authorization for user notifications: \(error.localizedDescription)")
        } else if granted {
            // User authorized notifications
            print("User authorized notifications")
        } else {
            // User denied notifications
            print("User denied notifications")
        }
    }
    return true
}

func scheduleNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Someone wants to connect!"
    content.body = "Meet them at Pantry, they want to know more about you!"
    content.sound = .default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            // Handle error
            print("Error scheduling notification: \(error.localizedDescription)")
        } else {
            // Notification scheduled successfully
            print("Notification scheduled successfully")
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                // Handle error
                print("Error requesting authorization for user notifications: \(error.localizedDescription)")
            } else if granted {
                // User authorized notifications
                print("User authorized notifications")
            } else {
                // User denied notifications
                print("User denied notifications")
            }
        }
       
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
            // Handle the notification response
            completionHandler()
        }
}
