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
    
    var refreshControl: UIRefreshControl?
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefreshControl()
        viewModel.controller = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCharacters()
    }
    
    //MARK: Methods
    
    func setupTableView() {
        charactersTable?.delegate = self
        charactersTable?.dataSource = self
        charactersTable?.registerCellNib(CharacterCell.self)
    }
    
    func setupRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.charactersTable?.refreshControl = refreshControl
    }
    
    @objc func refresh() {
        viewModel.fetchCharacters()
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
        cell.selectionStyle = .none
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
