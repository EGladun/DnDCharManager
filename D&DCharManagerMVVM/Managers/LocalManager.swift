//
//  LocalManager.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

class LocalManager {
    
    static let shared = LocalManager()
    private init() {}
    
    private var charsArray: [HeroCharacter] = []
    
    func getCharacters() -> [HeroCharacter] {
        return charsArray
    }
    
    func addNewCharacter(_ character: HeroCharacter) {
        charsArray.append(character)
    }
    
}
