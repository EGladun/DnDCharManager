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
    private let modelFactory: ViewModelsFactory
    
    private var charListView: CharListController?
    
    init(router: Router) {
        self.router = router
        controllerFactory = ViewControllersFactory()
        modelFactory = ViewModelsFactory()
    }
    
    func start() {
        startCharactersFlow()
    }
    
    private func startCharactersFlow() {
        charListView = controllerFactory.makeCharListVC(viewModel: modelFactory.makeCharListVM())
        
        router.push(charListView)
    }
    
}
