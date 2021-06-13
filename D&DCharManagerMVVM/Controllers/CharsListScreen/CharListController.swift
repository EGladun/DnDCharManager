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
    @IBOutlet weak var emptyView: UIView!
    
    //MARK: Variables and constants
    
    let presenter = CharListViewModel()
    
    var onPlusCharacter: (()->Void)?
    var onCharDetail: ((HeroCharacter)->Void)?
    
    var refreshControl: UIRefreshControl?
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefreshControl()
        presenter.controller = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.fetchCharacters()
    }
    
    //MARK: Methods
    
    /// Натсройка таблицы
    func setupTableView() {
        charactersTable?.delegate = self
        charactersTable?.dataSource = self
        charactersTable?.registerCellNib(CharacterCell.self)
    }
    
    /// Перезагрузка таблицы, отображение заглушки
    func updateTableView() {
        emptyView.isHidden = !presenter.getCharList().isEmpty
        charactersTable.reloadData()
    }
    
    /// Настройка лоадера загрузки
    func setupRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.charactersTable?.refreshControl = refreshControl
    }
    
    /// Метод обновления данных в таблице
    @objc func refresh() {
        presenter.fetchCharacters()
    }
    
    //MARK: Actions

    @IBAction func plusHandler(_ sender: Any) {
        onPlusCharacter?()
    }
}

extension CharListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCharList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterCell.self)) as! CharacterCell
        cell.fillData(with: presenter.getCharList()[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < presenter.getCharList().count else {
            return
        }
        let char = presenter.getCharList()[indexPath.row]
        onCharDetail?(char)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            presenter.deleteHero(indexPath.row)
        default:
            print("nothing")
        }
    }
}
