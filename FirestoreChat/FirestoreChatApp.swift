//
//  FirestoreChatApp.swift
//  Created by GaliSrikanth on 07/05/24.

/*
 Many thanks to
 https://www.youtube.com/watch?v=Zz9XQy8PRpQ
 */

import SwiftUI
import Firebase

@main
struct FirestoreChatApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
