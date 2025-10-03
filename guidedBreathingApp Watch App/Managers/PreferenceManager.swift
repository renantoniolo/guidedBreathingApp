//
//  PreferenceManager.swift
//  guidedBreathingApp
//
//  Created by Renan Toniolo Rocha on 22/09/25.
//

import Foundation

final class PreferenceManager {
    
    static let shared = PreferenceManager()
    private let userDefault: UserDefaults = .standard
    
    public func setTimer(section: MenuData.Section, timer: Int) {
        self.userDefault.set(timer, forKey: section.rawValue)
    }
    
    public func getTimer(section: MenuData.Section) -> Int? {
        return self.userDefault.value(forKey: section.rawValue) as? Int
    }
}
