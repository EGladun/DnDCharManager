//
//  VIewControllersFactory.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class ViewControllersFactory {
    
    func makeCharListVC(viewModel: CharListViewModel) -> CharListController {
        return CharListController(viewModel: viewModel)
    }
    
}
