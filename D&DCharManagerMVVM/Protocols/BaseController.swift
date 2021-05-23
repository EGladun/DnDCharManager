//
//  BaseController.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit

class BaseController: UIViewController {
    
    var onBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    func makeAlert(title: String, message: String, btnTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: btnTitle, style: .default, handler: {_ in
            alertController.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func backHandler(_ sender: Any) {
        onBack?()
    }
    
}
