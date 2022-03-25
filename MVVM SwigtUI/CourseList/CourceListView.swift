//
//  ContentView.swift
//  MVVM SwigtUI
//
//  Created by Олейник Богдан on 24.03.2022.
//

import SwiftUI

struct CourceListView: View {
    @StateObject private var viewModel = CourseListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.courseName) { courseDetailsViewModel in
                NavigationLink(destination: CourseDetailsView(viewModel: courseDetailsViewModel)) {
                    RowView(viewModel: courseDetailsViewModel)
                }
            }
            .navigationBarTitle("Courses")
        }
        .onAppear {
            viewModel.fetchCourses()
        }
    }
}

struct CourceListView_Previews: PreviewProvider {
    static var previews: some View {
        CourceListView()
    }
}
