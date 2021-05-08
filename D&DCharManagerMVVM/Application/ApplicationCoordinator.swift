//
//  ApplicationCoordinator.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class ApplicationCoordinator {
    
    private var router: Router
    private let controllerFactory: ViewControllersFactory
    
    private var charListView: CharListController?
    
    init(router: Router) {
        self.router = router
        controllerFactory = ViewControllersFactory()
    }
    
    func start() {
        startCharactersFlow()
    }
    
    private func startCharactersFlow() {
        charListView = controllerFactory.makeCharListVC()
        
        router.push(charListView)
    }
    
}
