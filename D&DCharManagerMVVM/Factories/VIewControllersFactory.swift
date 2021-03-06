//
//  VIewControllersFactory.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation
import UIKit

class ViewControllersFactory {
    
    func makeCharListVC() -> CharListController {
        return CharListController.controllerFromStoryboard("Main")
    }
    
    func makeAddCharVC() -> AddCharController {
        return AddCharController.controllerFromStoryboard("Main")
    }
    
    func makeCharDetailsVC() -> CharDetailsController {
        return CharDetailsController.controllerFromStoryboard("Main")
    }
}
