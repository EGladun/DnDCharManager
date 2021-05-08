//
//  AppDelegate.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    private lazy var router: Router = self.makeRouter()
    private var coordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController()
        window?.makeKeyAndVisible()
        
        start()
        return true
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

}

