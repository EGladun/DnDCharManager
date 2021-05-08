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
    
    func fillData(with character: HeroCharacter) {
        characterIcon.sd_setImage(with: URL(string: character.heroIcon), completed: nil)
        characterName.text = character.name
        characterClass.text = character.race.string + ", the " + character.gClass.string
    }
}
