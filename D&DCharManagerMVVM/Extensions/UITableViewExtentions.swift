//
//  UITableViewExtentions.swift
//  WINmobile
//
//  Created by user on 24.04.2020.
//  Copyright © 2020 winmobile. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewClass(_ viewClass: AnyClass) {
        let identifier = String(describing: viewClass)
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewNib(_ viewClass: AnyClass) {
        let identifier = String(describing: viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    func setFooter() {
        self.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 0))
        
    }
}

