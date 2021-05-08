//
//  BaseController.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        super.viewWillDisappear(animated)
    }
    
}
