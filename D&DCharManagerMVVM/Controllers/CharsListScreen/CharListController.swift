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
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
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
}
