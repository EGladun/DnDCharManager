//
//  CharacterCell.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit
import SDWebImage

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterIcon: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterClass: UILabel!
    @IBOutlet weak var cahracterRace: UIImageView!
    
    func fillData(with character: HeroCharacter) {
        characterIcon.image = UIImage(named: character.gClass.string)
        cahracterRace.image = UIImage(named: character.race.string)
        characterName.text = character.name
        characterClass.text = character.race.string + ", the " + character.gClass.string
    }
}
