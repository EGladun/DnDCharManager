//
//  AddCharController.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit

class AddCharController: BaseController {
    
    //MARK: Outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var racePicker: UIPickerView!
    @IBOutlet weak var classPicker: UIPickerView!
    
    //MARK: Variables and constants
    let viewModel = AddCharViewModel()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickers()
        setupDI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        racePicker.reloadAllComponents()
        classPicker.reloadAllComponents()
    }
    
    //MARK: Methods
    
    func setupPickers() {
        racePicker.dataSource = self
        racePicker.delegate = self
        classPicker.dataSource = self
        classPicker.delegate = self
    }
    
    func setupDI() {
        viewModel.heroCreated = { [weak self] in
            self?.onBack?()
        }
    }

    //MARK: Actions
    
    @IBAction func generateHandler(_ sender: Any) {
        if let name = nameField.text {
            viewModel.createHero(with: name)
        } else {
            let alertController = UIAlertController(title: "Oops", message: "I'm sorry", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Meh", style: .default, handler: {_ in
                alertController.dismiss(animated: true, completion: nil)
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

extension AddCharController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == racePicker {
            return viewModel.raceCount()
        }
        if pickerView == classPicker {
            return viewModel.classCount()
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == racePicker {
            return viewModel.allRaces[row].string
        }
        if pickerView == classPicker {
            return viewModel.allClasses[row].string
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == racePicker {
            viewModel.selectedRace = viewModel.allRaces[row]
        }
        if pickerView == classPicker {
            viewModel.selectedClass = viewModel.allClasses[row]
        }
    }
}
