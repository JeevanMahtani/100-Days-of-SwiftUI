//
//  LocalNotificationsView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 1/3/24.
//

import SwiftUI
import UserNotifications

struct LocalNotificationsView: View {
    var body: some View {
        VStack {
            Button("Request Notification") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set")
                    } else {
                        if let error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.defaultRingtone
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    LocalNotificationsView()
}
