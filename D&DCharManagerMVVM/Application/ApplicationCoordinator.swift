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
    private var charDetailsView: CharDetailsController?
    
    init(router: Router) {
        self.router = router
        factory = ViewControllersFactory()
    }
    
    func start() {
        startCharactersFlow()
    }
    
    func start(id: Int) {
        startCharactersFlow()
        toCharactersDetail(nil, id: id)
    }
    
    private func startCharactersFlow() {
        charListView = factory.makeCharListVC()
        
        charListView?.onPlusCharacter = { [weak self] in
            self?.addCharacter()
        }
        
        charListView?.onCharDetail = { [weak self] character in
            self?.toCharactersDetail(character, id: nil)
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
    
    private func toCharactersDetail(_ char: HeroCharacter?, id: Int?) {
        charDetailsView = factory.makeCharDetailsVC()
        
        charDetailsView?.onBack = { [weak self] in
            self?.router.popModule()
        }
        
        if let char = char {
            charDetailsView?.fillCharacter(char)
        } else if let id = id {
            charDetailsView?.fillCharacterId(id)
        }
        
        router.push(charDetailsView)
    }
    
}
