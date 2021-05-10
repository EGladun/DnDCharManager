//
//  CharListVIewModel.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class CharListViewModel: BaseViewModel {
    
    private var charList = [HeroCharacter]()
    
    func fetchCharacters() {
        charList = LocalManager.shared.getCharacters()
    }
    
    func getCharList() -> [HeroCharacter] {
        return charList
    }
    
    func addMockHeroes() {
        charList.append(HeroCharacter(name: "Konan", race: .human, height: 200, weight: 130, gClass: .barbarian, stats: CharStats(strenght: 15, agility: 10, wisdom: 7, luck: 8), icon: Race.human.string))
        charList.append(HeroCharacter(name: "Agronom", race: .human, height: 180, weight: 80, gClass: .pathfinder, stats: CharStats(strenght: 9, agility: 15, wisdom: 10, luck: 10), icon: Race.human.string))
    }
    
}
