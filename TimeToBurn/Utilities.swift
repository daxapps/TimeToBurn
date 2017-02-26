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
        defaults.setValue(value, forKey: defaultKeys.skinType)
        defaults.synchronize()
    }
    
    func getSkinType() -> String {
        let defaults = getStorage()
        if let result = defaults.string(forKey: defaultKeys.skinType) {
            return result
        }
        return SkinType().type1
    }
    
}

struct SkinType {
    let type1 = "Type 1 - Pale / Light"
    let type2 = "Type 2 - White / Fair"
    let type3 = "Type 3 - Medium"
    let type4 = "Type 4 - Olive Brown"
    let type5 = "Type 5 - Dark Brown"
    let type6 = "Type 6 - Very Dark / Black"
}

struct defaultKeys {
    static let skinType = "skinType"
}
