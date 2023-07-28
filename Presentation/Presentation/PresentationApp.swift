//
//  PresentationApp.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 20/07/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAnalytics

// MARK: Settings up Firebase
class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }

    // Since OTP requires remte notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
}


@main
struct PresentationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                RolesView()
                    .environmentObject(
                        DependencyInjectionContainer.shared.resolve(
                            RolesViewModel.self,
                            argument1: "+573145593725"
                        )!
                    )
            }
//            SplashView()
//                .environmentObject(DependencyInjectionContainer.shared.resolve(SplashViewModel.self)!)
        }
    }
}
