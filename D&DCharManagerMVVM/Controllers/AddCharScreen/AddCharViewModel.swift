//
//  AddCharViewModel.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class AddCharViewModel: BaseViewModel {
    
    var allRaces = Race.allCases
    var allClasses = Class.allCases
    
    var selectedRace: Race = .human
    var selectedClass: Class = .knight
    
    var heroCreated: (()->Void)?
    
    func raceCount() -> Int {
        return Race.allCases.count
    }
    
    func classCount() -> Int {
        return Class.allCases.count
    }
    
    func createHero(with name: String) {
        let hero = HeroCharacter(name: name, race: selectedRace, gClass: selectedClass, stats: CharStats(strenght: Int.random(in: 1...15), agility: Int.random(in: 1...15), wisdom: Int.random(in: 1...15), luck: Int.random(in: 1...15)))
        LocalManager.shared.addNewCharacter(hero)
        heroCreated?()
    }
    
}
