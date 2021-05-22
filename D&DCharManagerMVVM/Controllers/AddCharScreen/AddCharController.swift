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
    //
    @IBOutlet weak var strValue: UILabel!
    @IBOutlet weak var aglValue: UILabel!
    @IBOutlet weak var wsdValue: UILabel!
    @IBOutlet weak var luckValue: UILabel!
    //
    @IBOutlet weak var strMinus: UIButton!
    @IBOutlet weak var strPlus: UIButton!
    @IBOutlet weak var aglMinus: UIButton!
    @IBOutlet weak var aglPlus: UIButton!
    @IBOutlet weak var wsdMinus: UIButton!
    @IBOutlet weak var wsdPlus: UIButton!
    @IBOutlet weak var luckMinus: UIButton!
    @IBOutlet weak var luckPlus: UIButton!
    
    //MARK: Variables and constants
    let viewModel = AddCharViewModel()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.controller = self
        setupPickers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        racePicker.reloadAllComponents()
        classPicker.reloadAllComponents()
        updateStatValues()
    }
    
    //MARK: Methods
    
    func setupPickers() {
        racePicker.dataSource = self
        racePicker.delegate = self
        classPicker.dataSource = self
        classPicker.delegate = self
    }
    
    func updateStatValues() {
        strValue.text = String(viewModel.strength)
        aglValue.text = String(viewModel.agility)
        wsdValue.text = String(viewModel.wisdom)
        luckValue.text = String(viewModel.luck)
        
        strMinus.isHidden = viewModel.strength == 1
        aglMinus.isHidden = viewModel.agility == 1
        wsdMinus.isHidden = viewModel.wisdom == 1
        luckMinus.isHidden = viewModel.luck == 1
        
        strPlus.isHidden = viewModel.statSum == 42
        aglPlus.isHidden = viewModel.statSum == 42
        wsdPlus.isHidden = viewModel.statSum == 42
        luckPlus.isHidden = viewModel.statSum == 42
    }

    //MARK: Actions
    
    @IBAction func strMinus(_ sender: Any) {
        viewModel.decrementStat(.strength)
    }
    
    @IBAction func strPlus(_ sender: Any) {
        viewModel.incrementStat(.strength)
    }
    
    @IBAction func aglMinus(_ sender: Any) {
        viewModel.decrementStat(.agility)
    }
    
    @IBAction func aglPlus(_ sender: Any) {
        viewModel.incrementStat(.agility)
    }
    
    @IBAction func wsdMinus(_ sender: Any) {
        viewModel.decrementStat(.wisdom)
    }
    
    @IBAction func wsdPlus(_ sender: Any) {
        viewModel.incrementStat(.wisdom)
    }
    
    @IBAction func luckMinus(_ sender: Any) {
        viewModel.decrementStat(.luck)
    }
    
    @IBAction func luckPlus(_ sender: Any) {
        viewModel.incrementStat(.luck)
    }
    
    
    @IBAction func generateHandler(_ sender: Any) {
        guard viewModel.isNormalStatCount else {
            makeAlert(title: "Overstat", message: "Stat's sum cant be over 43", btnTitle: "Ok")
            return
        }
        
        if let name = nameField.text, name != "" {
            viewModel.createHero(with: name)
        } else {
            makeAlert(title: "Oops", message: "Enter character's name", btnTitle: "Ok")
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
