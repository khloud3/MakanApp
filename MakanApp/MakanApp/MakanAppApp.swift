//
//  MakanAppApp.swift
//  MakanApp
//
//  Created by khloud on 29/11/1444 AH.
//


import SwiftUI
import FirebaseCore
import FirebaseFirestore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
    
    func application(_ application: UIApplication , didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult{
        return .noData
    }
}


@main
struct MakanAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var otpViewModel = OTPViewModel()
    @StateObject private var vm = PlaceViewModel()
    var body: some Scene {
        WindowGroup {
            TabBar()
                .environmentObject(otpViewModel)
                .environmentObject(vm)
            
          
        }
    }
}
