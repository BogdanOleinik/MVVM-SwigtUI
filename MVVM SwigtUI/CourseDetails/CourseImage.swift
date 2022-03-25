//
//  CourseImage.swift
//  MVVM SwigtUI
//
//  Created by Олейник Богдан on 24.03.2022.
//

import SwiftUI

struct CourseImage: View {
    let imageData: Data?
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "xmark.shield") }
        guard let image = UIImage(data: data) else { return Image(systemName: "xmark.shield") }
        return Image(uiImage: image)
    }
}

struct CourseImage_Previews: PreviewProvider {
    static var previews: some View {
        CourseImage(
            imageData: nil,
            imageSize: CGSize(width: 230, height: 180),
            cornerRadius: 30,
            shadowIsOn: true
        )
    }
}
