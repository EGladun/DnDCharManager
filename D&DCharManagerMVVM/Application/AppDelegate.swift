//
//  AppDelegate.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    private lazy var router: Router = self.makeRouter()
    private var coordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        
        FirebaseApp.configure()
        
        start()
        return true
    }
    
    private func setupWindow() {
        window = UIWindow()
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
    
    private func makeRouter() -> Router {
        print("root controller: \(self.rootController)")
        return RouterImp(rootController: self.rootController)
    }
    
    private func makeCoordinator() -> ApplicationCoordinator {
        return ApplicationCoordinator(router: self.router)
    }
    
    func start() {
        self.coordinator = makeCoordinator()
        coordinator?.start()
    }
    
    func startWithDeeplink(id: Int) {
        self.coordinator = makeCoordinator()
        coordinator?.start(id: id)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme == "ddcman" {
            if let id = Int(url.host ?? "") {
                startWithDeeplink(id: id)
            } else {
                start()
            }
        }
        return true
    }
    
}

