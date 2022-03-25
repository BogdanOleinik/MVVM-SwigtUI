//
//  Person.swift
//  MVVM SwigtUI
//
//  Created by Олейник Богдан on 24.03.2022.
//

struct Course: Decodable {
    let name: String
    let imageUrl: String
    let numberOfLessons: Int
    let numberOfTests: Int
}

extension Course {
    static func getCourse() -> Course {
        return Course(
            name: "Course Name",
            imageUrl: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg",
            numberOfLessons: 40,
            numberOfTests: 10
        )
    }
}
