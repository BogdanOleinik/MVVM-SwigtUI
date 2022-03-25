//
//  CourseViewModel.swift
//  MVVM SwigtUI
//
//  Created by Олейник Богдан on 24.03.2022.
//

import Foundation

protocol CourseListViewModelProtocol {
    var rows: [CourseDetailsViewModel] { get }
    func fetchCourses()
}

class CourseListViewModel: CourseListViewModelProtocol, ObservableObject {
    @Published var rows: [CourseDetailsViewModel] = []
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { courses in
            courses.forEach { [unowned self] course in
                let courseDetailsViewModel = CourseDetailsViewModel(course: course)
                self.rows.append(courseDetailsViewModel)
            }
        }
    }
}
