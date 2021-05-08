//
//  ApplicationCoordinator.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class ApplicationCoordinator {
    
    private var router: Router
    private let factory: ViewControllersFactory
    
    private var charListView: CharListController?
    private var addCharView: AddCharController?
    
    init(router: Router) {
        self.router = router
        factory = ViewControllersFactory()
    }
    
    func start() {
        startCharactersFlow()
    }
    
    private func startCharactersFlow() {
        charListView = factory.makeCharListVC()
        
        charListView?.onPlusCharacter = { [weak self] in
            self?.addCharacter()
        }
        
        router.push(charListView)
    }
    
    private func addCharacter() {
        addCharView = factory.makeAddCharVC()
        
        addCharView?.onBack = { [weak self] in
            self?.router.popModule()
        }
        
        router.push(addCharView)
    }
    
}
