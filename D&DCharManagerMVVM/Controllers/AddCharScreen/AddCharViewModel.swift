//
//  AddCharViewModel.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class AddCharViewModel: BaseViewModel {
    
    var controller: AddCharController?
    
    var allRaces = Race.allCases
    var allClasses = Class.allCases
    
    var selectedRace: Race = .human
    var selectedClass: Class = .knight
    
    var strength: Int = 5 {
        didSet {
            controller?.updateStatValues()
        }
    }
    var agility: Int = 5 {
        didSet {
            controller?.updateStatValues()
        }
    }
    var wisdom: Int = 5 {
        didSet {
            controller?.updateStatValues()
        }
    }
    var luck: Int = 5 {
        didSet {
            controller?.updateStatValues()
        }
    }
    
    var statSum: Int {
        return strength + agility + wisdom + luck
    }
    
    var isNormalStatCount: Bool {
        return statSum < 43
    }
    
    func raceCount() -> Int {
        return Race.allCases.count
    }
    
    func classCount() -> Int {
        return Class.allCases.count
    }
    
    func incrementStat(_ statType: StatType) {
        switch statType {
        case .strength:
            strength += 1
        case .agility:
            agility += 1
        case .wisdom:
            wisdom += 1
        case .luck:
            luck += 1
        }
    }
    
    func decrementStat(_ statType: StatType) {
        switch statType {
        case .strength:
            strength -= 1
        case .agility:
            agility -= 1
        case .wisdom:
            wisdom -= 1
        case .luck:
            luck -= 1
        }
    }
    
    func createHero(with name: String) {
        let hero = HeroCharacter(name: name, race: selectedRace, gClass: selectedClass, stats: CharStats(strenght: strength, agility: agility, wisdom: wisdom, luck: luck))
        FirestoreManager.addHero(hero.toDictionary())
        controller?.onBack?()
    }
    
}

enum StatType {
    case strength
    case agility
    case wisdom
    case luck
}
