//
//  AddCharViewModel.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import Foundation

class AddCharViewModel: BaseViewModel {
    
    var allRaces = Race.allCases
    var allClasses = Class.allCases
    
    func raceCount() -> Int {
        return Race.allCases.count
    }
    
    func classCount() -> Int {
        return Class.allCases.count
    }
    
}
