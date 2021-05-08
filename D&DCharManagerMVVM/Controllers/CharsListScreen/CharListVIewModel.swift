//
//  CharListVIewModel.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class CharListViewModel: BaseViewModel {
    
    private var charList = [HeroCharacter]()
    
    func getCharList() -> [HeroCharacter] {
        return charList
    }
    
    func addMockHeroes() {
        charList.append(HeroCharacter(name: "Konan", race: .human, height: 200, weight: 130, gClass: .barbadian, stats: CharStats(strenght: 15, agility: 10, wisdom: 7, luck: 8), icon: "https://images.app.goo.gl/67czbyjKDTtvh8VJ8"))
        charList.append(HeroCharacter(name: "Agronom", race: .human, height: 180, weight: 80, gClass: .pathfinder, stats: CharStats(strenght: 9, agility: 15, wisdom: 10, luck: 10), icon: "https://images.app.goo.gl/wDng3wranSBwBJKa9"))
    }
    
}
