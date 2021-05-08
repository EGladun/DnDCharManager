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
        charList.append(HeroCharacter(name: "Konan", race: .human, height: 200, weight: 130, gClass: .barbadian, stats: CharStats(strenght: 15, agility: 10, wisdom: 7, luck: 8), icon: "https://images.unsplash.com/photo-1619797507204-40bbf8611bdd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80"))
        charList.append(HeroCharacter(name: "Agronom", race: .human, height: 180, weight: 80, gClass: .pathfinder, stats: CharStats(strenght: 9, agility: 15, wisdom: 10, luck: 10), icon: "https://images.unsplash.com/photo-1601890596438-5ac9be4e1340?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1886&q=80"))
    }
    
}
