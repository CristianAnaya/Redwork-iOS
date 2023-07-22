//
//  PresentationApp.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 20/07/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    Analytics.setAnalyticsCollectionEnabled(true)
    return true
  }
}

@main
struct PresentationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(DependencyInjectionContainer.shared.resolve(SplashViewModel.self)!)
        }
    }
}
