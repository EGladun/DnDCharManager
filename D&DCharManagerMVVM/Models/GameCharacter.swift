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
    var gClass: Class
    var stats: CharStats
    var id: Int
    
    internal init(name: String, race: Race, gClass: Class, stats: CharStats, id: Int) {
        self.name = name
        self.race = race
        self.gClass = gClass
        self.stats = stats
        self.id = id
    }
    
    func toDictionary() -> [String: Any] {
        var fields: [String: Any] = [:]
        fields["id"] = id
        fields["name"] = name
        fields["race"] = race.string
        fields["class"] = gClass.string
        fields["strength"] = stats.strenght
        fields["agility"] = stats.agility
        fields["wisdom"] = stats.wisdom
        fields["luck"] = stats.luck
        
        return fields
    }
    
}

enum Race: CaseIterable {
    case human, elf, dwarf, succubus, demon, dragonite, tiffling
    
    init(string: String) {
        var grace: Race = .human
        Race.allCases.forEach { (race) in
            if race.string == string {
                grace = race
            }
        }
        self = grace
    }
    
    var string: String {
        switch self {
        case .human:
            return "human"
        case .elf:
            return "elf"
        case .dwarf:
            return "dwarf"
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

enum Class: CaseIterable {
    case knight, mage, rogue, thief, barbarian, warlock, shaman, druid, pathfinder
    
    init(string: String) {
        var gclass: Class = .knight
        Class.allCases.forEach { (cls) in
            if cls.string == string {
                gclass = cls
            }
        }
        self = gclass
    }
    
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
        case .barbarian:
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
