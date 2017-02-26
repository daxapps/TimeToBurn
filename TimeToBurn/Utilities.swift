//
//  Utilities.swift
//  TimeToBurn
//
//  Created by Jason Crawford on 2/26/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import Foundation

class Utilities {
    
    func getStorage() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func setSkinType(value: String) {
        let defaults = getStorage()
        defaults.setValue(value, forKey: defaultsKeys.skinType)
        defaults.synchronize()
    }
    
    func getSkinType() -> String {
        let defaults = getStorage()
        if let result = defaults.string(forKey: defaultsKeys.skinType) {
            return result
        }
        return SkinType().type1
    }
    
}


