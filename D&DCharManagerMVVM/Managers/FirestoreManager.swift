//
//  FirestoreManager.swift
//  D&DCharManagerMVVM
//
//  Created by user on 22.05.2021.
//

import Foundation
import Firebase

class FirestoreManager {
    
    private static let db = Firestore.firestore()
    
    class func getHeroes() -> [HeroCharacter] {
        var heroes = [HeroCharacter]()
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
                heroes.append(newHero)
            }
        }
        
        return heroes
    }
    
    class func addHero(_ dictionary: [String: Any]) {
        db.collection("Characters").addDocument(data: dictionary)
    }
    
}
