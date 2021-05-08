//
//  GameCharacter.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class HeroCharacter {
    
    var name: String
    var race: Race
    var height: Float
    var weight: Float
    var gClass: Class
    var stats: CharStats
    var heroIcon: String
    
    internal init(name: String, race: Race, height: Float, weight: Float, gClass: Class, stats: CharStats, icon: String) {
        self.name = name
        self.race = race
        self.height = height
        self.weight = weight
        self.gClass = gClass
        self.stats = stats
        self.heroIcon = icon
    }
    
}

enum Race {
    case human, elf, dwarf, nightElf, highElf, succubus, demon, dragonite, tiffling
    
    var string: String {
        switch self {
        case .human:
            return "human"
        case .elf:
            return "elf"
        case .dwarf:
            return "dwarf"
        case .nightElf:
            return "night elf"
        case .highElf:
            return "high elf"
        case .succubus:
            return "succubus"
        case .demon:
            return "demon"
        case .dragonite:
            return "dragonite"
        case .tiffling:
            return "tiffling"
        }
    }
}

enum Class {
    case knight, mage, rogue, thief, barbadian, warlock, shaman, druid, pathfinder
    
    var string: String {
        switch self {
        case .knight:
            return "Knight"
        case .mage:
            return "Mage"
        case .rogue:
            return "Rogue"
        case .thief:
            return "Thief"
        case .barbadian:
            return "Barbarian"
        case .warlock:
            return "Warlock"
        case .shaman:
            return "Shaman"
        case .druid:
            return "Druid"
        case .pathfinder:
            return "Pathfinder"
        }
    }
}
