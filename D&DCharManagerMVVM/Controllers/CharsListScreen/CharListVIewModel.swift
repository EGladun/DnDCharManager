//
//  CharListVIewModel.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation
import Firebase

class CharListViewModel: BaseViewModel {
    
    private var charList = [HeroCharacter]() {
        didSet {
            controller?.charactersTable.reloadData()
        }
    }
    
    var controller: CharListController?
    
    func fetchCharacters() {
        charList.removeAll()
        let db = Firestore.firestore()
        
        db.collection("Characters").getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            for document in snapshot.documents {
                let data = document.data()
                let newHero = HeroCharacter(name: data["name"] as? String ?? "Error name",
                                            race: Race(string: data["race"] as? String ?? "human"),
                                            gClass: Class(string: data["class"] as? String ?? ""),
                                            stats: CharStats(strenght: data["strength"] as! Int, agility: data["agility"] as! Int, wisdom: data["wisdom"] as! Int, luck: data["luck"] as! Int))
                self.charList.append(newHero)
            }
        }
    }
    
    func getCharList() -> [HeroCharacter] {
        return charList
    }
    
    func addMockHeroes() {
        charList.append(HeroCharacter(name: "Konan", race: .human, gClass: .barbarian, stats: CharStats(strenght: 15, agility: 10, wisdom: 7, luck: 8)))
        charList.append(HeroCharacter(name: "Agronom", race: .human, gClass: .pathfinder, stats: CharStats(strenght: 9, agility: 15, wisdom: 10, luck: 10)))
    }
    
}
