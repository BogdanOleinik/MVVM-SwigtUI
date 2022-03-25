//
//  DataManager.swift
//  MVVM SwigtUI
//
//  Created by Олейник Богдан on 24.03.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveFavoritesStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func loadFavouriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
