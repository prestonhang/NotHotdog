//
//  AnalyzePhotoView.swift
//  NotHotdog
//
//  Created by Preston Hang on 12/7/25.
//

import SwiftUI
import PhotosUI

struct AnalyzePhotoView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhoto: UIImage?
    @State private var showCamera: Bool = false
    
    var body: some View {
        if let selectedPhoto = selectedPhoto {
            Image(uiImage: selectedPhoto)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(20)
        }
        
        Button(action: { showCamera = true}) {
            Text("Find out if a photo has a Hotdog")
                .font(.headline)
                .padding(20)
                .frame(maxWidth: 300)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(50)
        }
        .sheet(isPresented: $showCamera) {
            CameraView(image: $selectedPhoto)
        }
    }
}


#Preview
{
    AnalyzePhotoView()
}
