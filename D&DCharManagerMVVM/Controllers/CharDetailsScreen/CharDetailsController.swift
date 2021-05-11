//
//  CharDetailsController.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 11.05.2021.
//

import UIKit

class CharDetailsController: BaseController {

    @IBOutlet weak var classIcon: UIImageView!
    @IBOutlet weak var raceIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var agilityLabel: UILabel!
    @IBOutlet weak var wisdomLabel: UILabel!
    @IBOutlet weak var luckLabel: UILabel!
    
    let viewModel = CharDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    func fillCharacter(_ char: HeroCharacter) {
        viewModel.character = char
    }
    
    private func setupView() {
        guard let hero = viewModel.character else {
            return
        }
        
        classIcon.image = UIImage(named: hero.gClass.string)
        raceIcon.image = UIImage(named: hero.race.string)
        nameLabel.text = hero.name
        strengthLabel.text = "Strength: \(hero.stats.strenght)"
        agilityLabel.text = "Agility: \(hero.stats.agility)"
        wisdomLabel.text = "Wisdom: \(hero.stats.wisdom)"
        luckLabel.text = "Luck: \(hero.stats.luck)"
    }

    @IBAction func shareButton(_ sender: Any) {
        
    }
}
