//
//  CharDetailsViewModel.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 11.05.2021.
//

import Foundation
import Firebase

class CharDetailsViewModel: BaseViewModel {
    var character: HeroCharacter? {
        didSet {
            controller?.setupView()
        }
    }
    
    var controller: CharDetailsController?
    
    func getCurrentHero(with id: Int) {
        let db = Firestore.firestore()
        db.collection("Characters").whereField("id", isEqualTo: id).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            for document in snapshot.documents {
                let data = document.data()
                let detailedHero = HeroCharacter(name: data["name"] as? String ?? "Error name",
                                            race: Race(string: data["race"] as? String ?? "human"),
                                            gClass: Class(string: data["class"] as? String ?? ""),
                                            stats: CharStats(strenght: data["strength"] as! Int, agility: data["agility"] as! Int, wisdom: data["wisdom"] as! Int, luck: data["luck"] as! Int),
                                            id: data["id"] as? Int ?? 0)
                self.character = detailedHero
            }
        }
    }
}
