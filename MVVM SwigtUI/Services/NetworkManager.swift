//
//  NetworkManager.swift
//  MVVM SwigtUI
//
//  Created by Олейник Богдан on 24.03.2022.
//

import Foundation
import SwiftUI

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCourses(completion: @escaping (_ courses: [Course]) -> Void) {
        guard let url = URL(string: Constants.courseURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(courses)
                }
            } catch let error {
                print("Error serialization json", error.localizedDescription)
            }
            
        }.resume()
    }
    
        func fetchImageData(from url: String) -> Data? {
            guard let imageURL = URL(string: url) else { return nil }
            guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
            return imageData
    }
}

enum Constants: String {
    case courseURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
}
