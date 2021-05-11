//
//  CharListController.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit

class CharListController: BaseController {
    
    //MARK: Outlets
    @IBOutlet weak var charactersTable: UITableView!
    
    //MARK: Variables and constants
    
    let viewModel = CharListViewModel()
    
    var onPlusCharacter: (()->Void)?
    var onCharDetail: ((HeroCharacter)->Void)?
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCharacters()
        viewModel.addMockHeroes()
        charactersTable?.reloadData()
    }
    
    //MARK: Methods
    
    func setupTableView() {
        charactersTable?.delegate = self
        charactersTable?.dataSource = self
        charactersTable?.registerCellNib(CharacterCell.self)
    }
    
    //MARK: Actions

    @IBAction func plusHandler(_ sender: Any) {
        onPlusCharacter?()
    }
}

extension CharListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCharList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterCell.self)) as! CharacterCell
        cell.fillData(with: viewModel.getCharList()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < viewModel.getCharList().count else {
            return
        }
        let char = viewModel.getCharList()[indexPath.row]
        onCharDetail?(char)
    }
}
