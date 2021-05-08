//
//  BaseController.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit

class BaseController: UIViewController {
    
    var onBack: (() -> Void)?
    
    @IBAction func backHandler(_ sender: Any) {
        onBack?()
    }
    
}
